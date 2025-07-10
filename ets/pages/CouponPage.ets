import AppBar from '../components/AppBar'
import router from '@ohos.router'

// 定义优惠券类型接口
interface CouponItem {
  title: string
  discount: string
  condition: string
}

@Entry
@Component
struct CouponPage {
  // 定义优惠券数据
  private newCoupons: CouponItem[] = [
    { title: "新客专享券", discount: "￥5", condition: "满40元可用" },
    { title: "电影代金券", discount: "￥25", condition: "满200元可用" },
    { title: "剧场代金券", discount: "￥60", condition: "满500元可用" }
  ]

  private selectedCoupons: CouponItem[] = [
    { title: "演出代金券", discount: "￥20", condition: "满300元可用" },
    { title: "演出代金券", discount: "￥30", condition: "满500元可用" },
    { title: "演出代金券", discount: "￥40", condition: "满600元可用" }
  ]

  build() {
    Column() {
      AppBar({ title: "影城神券" })

      Scroll() {
        Column() {
          // 顶部标语
          Text("影城神券下单超划算")
            .fontSize(16)
            .fontColor('#666666')
            .margin({ bottom: 16 })
            .width('100%')
            .textAlign(TextAlign.Center)

          // 我的优惠券入口
          Row() {
            Text("我的优惠券")
              .fontSize(16)
              .fontWeight(FontWeight.Bold)

            Blank()

            Image($r("app.media.right")) // 修改为正确的资源名称
              .width(16)
              .height(16)
          }
          .width('90%')
          .height(50)
          .padding({ left: 16, right: 16 })
          .backgroundColor('#ffffff')
          .borderRadius(8)
          .margin({ bottom: 16 })
          .onClick(() => {
            console.log("我的优惠券被点击")
          })

          // 神券同周领
          this.sectionTitle("神券同周领")
          this.couponGrid(this.newCoupons)

          // 精选好券
          this.sectionTitle("精选好券")
          this.couponGrid(this.selectedCoupons)
        }.width("100%").alignItems(HorizontalAlign.Start)
      }.width("100%").layoutWeight(1).align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f5f5f5')
  }

  // 区块标题
  @Builder
  sectionTitle(title: string) {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .margin({ left: 16, top: 16, bottom: 12 })
      .width('100%')
      .textAlign(TextAlign.Start)
  }

  // 优惠券网格
  @Builder
  couponGrid(coupons: CouponItem[]) {
    Grid() {
      ForEach(coupons, (coupon: CouponItem) => {
        GridItem() {
          Column() {
            Text(coupon.title)
              .fontSize(14)
              .fontColor('#666666')
              .margin({ bottom: 8 })

            Text(coupon.discount)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#ff0000')
              .margin({ bottom: 4 })

            Text(coupon.condition)
              .fontSize(12)
              .fontColor('#999999')
              .margin({ bottom: 12 })

            Button("立即抢", { type: ButtonType.Capsule })
              .width(80)
              .height(30)
              .backgroundColor('#ff0000')
              .fontColor(Color.White)
              .fontSize(12)
          }
          .width('100%')
          .height('100%')
          .padding(12)
          .backgroundColor(Color.White)
          .borderRadius(8)
        }
      })
    }
    .columnsTemplate('1fr 1fr 1fr')
    .rowsTemplate('1fr')
    .columnsGap(12)
    .rowsGap(12)
    .width('100%')
    .height(140)
    .padding({ left: 16, right: 16 })
  }
}
