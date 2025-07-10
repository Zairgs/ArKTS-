// pages/MyOrder/movie.ets
import router from '@ohos.router';

@Entry
@Component
struct MoviePage {
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

        Text('在线观影')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({ top: 16, bottom: 16 })
      .justifyContent(FlexAlign.Start)

      // 内容区域
      Column() {
        Column() {
          Image($r('app.media.dislike'))
            .width(120)
            .height(120)
            .margin({ bottom: 16 })
          Text('这里还没有票哼哼~')
            .fontSize(16)
            .fontColor('#999999')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .margin({ top: 8 })
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor('#F8F8F8')
  }
}
