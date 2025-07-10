// pages/MyCards/CinemaCard.ets
import router from '@ohos.router';

interface CardInfo {
  title: string;
  price: string;
  originalPrice: string;
  validity: string;
  tag: string;
}

@Entry
@Component
struct CinemaCard {
  @State hasCard: boolean = false;
  @State recommendedCards: CardInfo[] = [
    {
      title: '会员季卡',
      price: '￥9.9',
      originalPrice: '¥20',
      validity: '有效期3个月',
      tag: '开卡特惠'
    },
    {
      title: '影城半年卡',
      price: '￥19.9',
      originalPrice: '¥30',
      validity: '有效期6个月',
      tag: '开卡特惠'
    },
    {
      title: '影城季卡',
      price: '￥9.9',
      originalPrice: '¥19.5',
      validity: '有效期2个月',
      tag: '开卡特惠'
    }
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

        Text('影城卡')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({ top: 16, bottom: 16 })
      .justifyContent(FlexAlign.Start)

      Scroll() {
        Column({ space: 12 }) {
          // 影城卡入口
          Row({ space: 10 }) {
            Column() {
              Text('更多影城卡哼哼~')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .width('100%')
                .textAlign(TextAlign.Start)

              Text('购票优惠多多，尊享影院特权哼哼~')
                .fontSize(12)
                .fontColor('#999999')
                .margin({ top: 4 })
                .width('100%')
                .textAlign(TextAlign.Start)
            }
            .layoutWeight(1)

            Text('查看 >')
              .fontSize(14)
              .fontColor('#FF0000')
              .onClick(() => {
                router.pushUrl({ url: 'pages/CinemaList' })
              })
          }
          .width('100%')
          .padding(12)
          .backgroundColor(Color.White)
          .borderRadius(10)

          // 状态提示区
          if (!this.hasCard) {
            Column({ space: 8 }) {
              Text('暂未开通影城卡哼哼~')
                .fontSize(16)
                .fontColor('#666666')

              Text('为你推荐影城卡')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .textAlign(TextAlign.Start)
            }
            .width('100%')
            .padding(12)
            .backgroundColor(Color.White)
            .borderRadius(10)
          }

          // 推荐卡片列表
          Column({ space: 12 }) {
            ForEach(this.recommendedCards, (item: CardInfo) => {
              Column({ space: 8 }) {
                // 标签
                if (item.tag) {
                  Text(item.tag)
                    .fontSize(12)
                    .fontColor('#FF0000')
                    .border({ width: 1, color: '#FF0000' })
                    .borderRadius(4)
                    .padding({ left: 4, right: 4 })
                    .alignSelf(ItemAlign.Start)
                }

                // 卡片标题
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                  .textAlign(TextAlign.Start)

                // 价格信息
                Row() {
                  Text(item.price)
                    .fontSize(18)
                    .fontColor('#FF0000')

                  Text(item.originalPrice)
                    .fontSize(12)
                    .fontColor('#999999')
                    .decoration({ type: TextDecorationType.LineThrough })
                    .margin({ left: 8 })

                  Blank()

                  Text(item.validity)
                    .fontSize(12)
                    .fontColor('#999999')
                }
                .width('100%')

                // 使用说明
                Text('使用说明')
                  .fontSize(12)
                  .fontColor('#0066CC')
                  .width('100%')
                  .textAlign(TextAlign.End)
              }
              .width('100%')
              .padding(12)
              .backgroundColor(Color.White)
              .borderRadius(10)
            })
          }
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
