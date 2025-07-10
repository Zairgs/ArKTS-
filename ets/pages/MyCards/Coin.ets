// pages/MyCoins/MyCoins.ets
import router from '@ohos.router';

interface SignInReward {
  day: number;
  reward: string;
  status: string;
  special: boolean;
}

interface Task {
  title: string;
  action: string;
  duration?: string;
}

interface MovieCoupon {
  type: string;
  name: string;
  price: string;
}

interface ShowCoupon {
  limit: string;
  value: string;
  type: string;
  price: string;
}

@Entry
@Component
struct MyCoinsPage {
  @State signedDays: number = 3;
  @State signInRewards: SignInReward[] = [
    { day: 1, reward: "+5", status: "已签", special: false },
    { day: 2, reward: "+5", status: "已签", special: false },
    { day: 3, reward: "+5", status: "3天", special: false },
    { day: 4, reward: "+5", status: "4天", special: false },
    { day: 5, reward: "惊喜红包", status: "连签5天", special: true },
    { day: 6, reward: "+5", status: "6天", special: false },
    { day: 7, reward: "惊喜红包", status: "连签7天", special: true }
  ];

  @State tasks: Task[] = [
    { title: "领取本周神券，购票超划算", action: "去领取" },
    { title: "热映电影火热购票中，浏览影片详情页", action: "去看看", duration: "10s" }
  ];

  @State movieCoupons: MovieCoupon[] = [
    { type: "买一赠", name: "《恶意》买一赠一券", price: "599喵币" },
    { type: "立减8元", name: "《恶意》8元立减券", price: "199喵币" },
    { type: "纪念票根", name: "《侏罗纪世界：重生》IMAX特别版…", price: "1影城币" }
  ];

  @State showCoupons: ShowCoupon[] = [
    { limit: "每日限量", value: "￥10", type: "演出优惠券", price: "" },
    { limit: "限兑换1次", value: "￥20", type: "演出优惠券", price: "" },
    { limit: "每日限量", value: "￥5", type: "演出优惠券", price: "" },
    { limit: "", value: "", type: "【本地演出多品类通用】10元演出…", price: "159影城币" }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
          .margin({ left: 12, right: 16 })
          .onClick(() => {
            router.back();
          })

        Text('赚影城币 享权益')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)
      .alignItems(VerticalAlign.Center)

      // 内容区域
      Scroll() {
        Column({ space: 12 }) {
          // 签到奖励模块
          Column({ space: 8 }) {
            Text('每日签到领奖励')
              .fontSize(16)
              .margin({ left: 16, top: 16 })

            Text('今日签到+5影城币，连续签到再领惊喜红包！')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ left: 16 })

            Grid() {
              ForEach(this.signInRewards, (item: SignInReward) => {
                GridItem() {
                  Column({ space: 4 }) {
                    Text(item.reward)
                      .fontSize(14)
                      .fontColor(item.special ? '#FF0000' : '#333333')

                    Text(item.status)
                      .fontSize(12)
                      .fontColor(this.signedDays >= item.day ? '#FF0000' : '#999999')
                  }
                  .width('100%')
                  .height(80)
                  .justifyContent(FlexAlign.Center)
                  .border({ width: 1, color: '#EEEEEE' })
                }
              })
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
            .rowsTemplate('1fr')
            .columnsGap(0)
            .rowsGap(0)
            .margin({ left: 16, right: 16, top: 16 })
          }
          .backgroundColor(Color.White)
          .borderRadius(10)
          .padding(12)

          // 任务赚币模块
          Column({ space: 8 }) {
            Text('做任务赚优惠')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .margin({ left: 16, top: 16 })

            ForEach(this.tasks, (task: Task) => {
              Column({ space: 8 }) {
                Row() {
                  Text(task.title)
                    .fontSize(14)
                    .layoutWeight(1)

                  Button(task.action)
                    .fontSize(12)
                    .width(72)
                    .height(28)
                    .backgroundColor('#FFF5F5')
                    .fontColor('#FF0000')
                }
                .width('100%')
                .padding(16)

                if (task.duration) {
                  Text(task.duration)
                    .fontSize(12)
                    .fontColor('#999999')
                    .margin({ left: 16, bottom: 8 })
                }

                Divider()
                  .strokeWidth(1)
                  .color('#F5F5F5')
              }
            })

            Text('更多3个任务')
              .fontSize(14)
              .fontColor('#0066CC')
              .margin({ left: 16, top: 8, bottom: 16 })
          }
          .backgroundColor(Color.White)
          .borderRadius(10)
          .padding(12)

          // 电影权益兑换模块
          Column({ space: 8 }) {
            Text('电影权益兑换')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .margin({ left: 16, top: 16 })

            Grid() {
              ForEach(this.movieCoupons, (coupon: MovieCoupon) => {
                GridItem() {
                  Column({ space: 4 }) {
                    Text(coupon.type)
                      .fontSize(12)
                      .fontColor('#FF0000')

                    Text(coupon.name)
                      .fontSize(14)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })

                    Text(coupon.price)
                      .fontSize(12)
                      .fontColor('#999999')
                  }
                  .width('90%')
                  .height(120)
                  .padding(8)
                  .backgroundColor(Color.White)
                  .borderRadius(8)
                  .shadow({ radius: 2, color: '#10000000' })
                }
              })
            }
            .columnsTemplate('1fr 1fr')
            .rowsTemplate('1fr')
            .columnsGap(12)
            .rowsGap(12)
            .margin({ left: 16, right: 16, top: 8, bottom: 16 })
          }
          .backgroundColor(Color.White)
          .borderRadius(10)
          .padding(12)
        }
        .width('100%')
        .padding(12)
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F8F8F8')
    }
    .width('100%')
    .height('100%')
  }
}
