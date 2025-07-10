import AppBar from '../components/AppBar';
import { CommonItem } from '../components/CommonItem';
import { HorizontalDivider } from '../components/MyDivider'

@Entry
@Component
struct SettingPage {
  build() {
    Column() {
      AppBar({ title: "设置" })
      Scroll() {
        Column() {
          CommonItem({ leftText: "账号管理" }) {
            Row() {
              Image($r('app.media.avatar')).width(56).aspectRatio(1).borderRadius(28)
            }.layoutWeight(1).justifyContent(FlexAlign.End).padding({ top: 12, bottom: 12 })
          }

          HorizontalDivider()
          CommonItem({ leftText: "手机号码" }) {
            Row() {
              Text('187****4658')
            }.layoutWeight(1).justifyContent(FlexAlign.End)
          }

          HorizontalDivider()
          CommonItem({ leftText: "账号安全" })
          HorizontalDivider()
          CommonItem({ leftText: "隐私" })
          HorizontalDivider()
          CommonItem({ leftText: "消息通知" }).onClick(() => {
            this.getUIContext().getPromptAction().showDialog({
              title: "提示",
              message: "无消息！"
            })
          })
          HorizontalDivider()
          CommonItem({ leftText: "通用" }).onClick(() => {
            this.getUIContext().getRouter().pushUrl({ url: "pages/NormalPage" })
          })
          HorizontalDivider()
          CommonItem({ leftText: "关于" })
          HorizontalDivider()
        }.width("100%").alignItems(HorizontalAlign.Start)
      }.width("100%").layoutWeight(1).align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
  }
}
