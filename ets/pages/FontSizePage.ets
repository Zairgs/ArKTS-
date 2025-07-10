// FontSizePage.ets
import AppBar from '../components/AppBar'
import { HorizontalDivider } from '../components/MyDivider'

@Entry
@Component
struct FontSizePage {
  @State currentSize: number = 2 // 默认中等大小
  private sizes: string[] = ['小', '标准', '大', '特大']
  private sizeDescriptions: string[] = [
    '适用于近距离阅读',
    '系统默认大小',
    '适用于稍远距离阅读',
    '适用于远距离阅读'
  ]

  build() {
    Column() {
      AppBar({ title: "字体大小" })

      Scroll() {
        Column() {
          // 预览区域
          Column() {
            Text("预览字体大小")
              .fontSize(20)
              .fontColor(0x333333)
              .margin({ top: 20, bottom: 30 })

            Text("你可以通过调整字体大小来改变阅读体验")
              .fontSize(this.getPreviewFontSize())
              .fontColor(0x333333)
              .textAlign(TextAlign.Center)
              .width('100%')
          }
          .width('100%')
          .padding(20)
          .alignItems(HorizontalAlign.Center)

          HorizontalDivider()

          // 字体大小选项
          Column() {
            ForEach(this.sizes, (item: string, index: number) => {
              Row() {
                Column() {
                  Text(item)
                    .fontSize(18)
                    .fontColor(this.currentSize === index ? 0x007DFF : 0x333333)

                  Text(this.sizeDescriptions[index])
                    .fontSize(14)
                    .fontColor(0x999999)
                    .margin({ top: 5 })
                }
                .layoutWeight(1)

                if (this.currentSize === index) {
                  Image($r("app.media.zitidaxiao"))
                    .width(20)
                    .height(20)
                }
              }
              .width('100%')
              .padding(15)
              .onClick(() => {
                this.currentSize = index
                // 这里可以添加实际改变字体大小的逻辑
              })

              if (index < this.sizes.length - 1) {
                HorizontalDivider()
                  .margin({ left: 15 })
              }
            })
          }
          .width('100%')
          .backgroundColor(0xFFFFFF)
          .borderRadius(12)
          .margin(12)
        }
      }
      .width('100%')
      .layoutWeight(1)
    }
    .height('100%')
    .width('100%')
    .backgroundColor(0xF5F5F5)
  }

  // 根据当前选择返回预览字体大小
  private getPreviewFontSize(): number {
    switch (this.currentSize) {
      case 0: return 14 // 小
      case 1: return 16 // 标准
      case 2: return 18 // 大
      case 3: return 20 // 特大
      default: return 16
    }
  }
}
