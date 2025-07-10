// pages/Show/Show.ets
import router from '@ohos.router';

@Entry
@Component
struct ShowPage {
  @State currentTopTab: number = 0; // 0=演出，1=玩乐
  @State currentBottomTab: number = 0; // 0=票夹，1=订单

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

        Text('演出/玩乐')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({ top: 16, bottom: 16 })
      .justifyContent(FlexAlign.Start)

      // 顶部Tab栏
      Row() {
        ForEach([0, 1], (index: number) => {
          Column() {
            Text(index === 0 ? '演出' : '玩乐')
              .fontSize(16)
              .fontColor(this.currentTopTab === index ? '#FF0000' : '#666666')
              .margin({ bottom: 4 })

            if (this.currentTopTab === index) {
              Divider()
                .strokeWidth(2)
                .color('#FF0000')
            }
          }
          .onClick(() => { this.currentTopTab = index })
          .layoutWeight(1)
          .height(48)
          .justifyContent(FlexAlign.Center)
        })
      }
      .width('100%')
      .borderRadius(8)
      .margin({ bottom: 12 })
      .backgroundColor(Color.White)

      // 内容区域
      Column() {
        if (this.currentTopTab === 0) {
          this.PerformanceContent(this.currentBottomTab)
        } else {
          this.PlayContent(this.currentBottomTab)
        }
      }
      .layoutWeight(1)

      // 底部Tab栏
      Divider()
      Row() {
        ForEach([0, 1], (index: number) => {
          Column() {
            Text(index === 0 ? '票夹' : '订单')
              .fontSize(14)
              .fontColor(this.currentBottomTab === index ? '#FF0000' : '#999999')
              .margin({ bottom: 4 })

            if (this.currentBottomTab === index) {
              Divider()
                .strokeWidth(2)
                .color('#FF0000')
                .width(24)
            }
          }
          .onClick(() => { this.currentBottomTab = index })
          .layoutWeight(1)
          .height(48)
          .justifyContent(FlexAlign.Center)
        })
      }
      .width('100%')
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8F8F8')
  }

  @Builder
  PerformanceContent(bottomTab: number) {
    Column() {
      Column() {
        Image($r('app.media.dislike'))
          .width(120)
          .height(120)
          .margin({ bottom: 16 })
        Text('这里还没有票')
          .fontSize(16)
          .fontColor('#999999')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
  }

  @Builder
  PlayContent(bottomTab: number) {
    Column() {
      Column() {
        Image($r('app.media.dislike'))
          .width(120)
          .height(120)
          .margin({ bottom: 16 })
        Text('这里还没有票')
          .fontSize(16)
          .fontColor('#999999')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
  }
}
