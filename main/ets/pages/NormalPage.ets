import AppBar from '../components/AppBar'
import { CommonItem } from '../components/CommonItem'
import { HorizontalDivider } from '../components/MyDivider'
import router from '@ohos.router'

@Entry
@Component
struct NormalPage {
  @State
  isOn: boolean = true

  build() {
    Column() {
      AppBar({ title: "通用" })
      Scroll() {
        Column() {
          CommonItem({ leftText: "字体大小" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/FontSizePage'
              })
            })
          HorizontalDivider()
          CommonItem({ leftText: "存储空间" })
          HorizontalDivider()
          CommonItem({ leftText: "聊天记录备份迁移" })
          HorizontalDivider()
          CommonItem({ leftText: "聊天" })
          HorizontalDivider()
          CommonItem({ leftText: "自动下载与保存" })
          HorizontalDivider()
          CommonItem({ leftText: "系统通知栏显示图标" }) {
            Row() {
              Toggle({ isOn: $$this.isOn, type: ToggleType.Switch })
            }.layoutWeight(1).justifyContent(FlexAlign.End)
          }
          HorizontalDivider()
        }.width("100%").alignItems(HorizontalAlign.Start)
      }.width("100%").layoutWeight(1).align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
  }
}
