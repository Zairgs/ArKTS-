// pages/MyCards/Coupon.ets
import router from '@ohos.router';

// 定义优惠券数据类型
interface CouponItem {
  id: string;
  title: string;
  // 可以根据实际需求添加更多字段
  // 例如: value: string; expireDate: string; status: string;
}

@Entry
@Component
struct Coupon {
  @State coupons: CouponItem[] = []; // 使用明确定义的接口类型

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

        Text('我的优惠券')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({ top: 16, bottom: 16 })
      .justifyContent(FlexAlign.Start)

      // 内容区域
      Scroll() {
        Column({ space: 12 }) {
          if (this.coupons.length > 0) {
            // 优惠券列表
            Column({ space: 12 }) {
              ForEach(this.coupons, (item: CouponItem) => {
                Column() {
                  Text(item.title)
                    .fontSize(16)
                    .margin({ bottom: 12 })
                }
                .width('100%')
                .padding(12)
                .backgroundColor(Color.White)
                .borderRadius(10)
              })
            }
          } else {
            // 空状态
            Column() {
              Image($r('app.media.dislike'))
                .width(120)
                .height(120)
                .margin({ bottom: 16 })
              Text('暂无可用优惠券哼哼~')
                .fontSize(16)
                .fontColor('#999999')
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
          }
        }
        .width('100%')
        .padding(12)
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#F8F8F8')

      // 底部操作栏
      Column() {
        Divider()
        Row({ space: 12 }) {
          Text('添加优惠券')
            .fontSize(14)
            .fontColor('#FF0000')
            .onClick(() => router.pushUrl({ url: 'pages/AddCoupon' }))

          Divider()
            .vertical(true)
            .height(14)
            .color('#EEEEEE')

          Text('查看失效券')
            .fontSize(14)
            .fontColor('#666666')
            .onClick(() => router.pushUrl({ url: 'pages/ExpiredCoupon' }))
        }
        .padding(16)
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
  }
}
