import AppBar from '../components/AppBar'
import router from '@ohos.router'

@Entry
@Component
struct RealNameInfoPage {
  @State name: string = ''
  @State idNumber: string = ''
  @State isDefault: boolean = false
  @State agreeProtocol: boolean = false

  build() {
    Column() {
      AppBar({ title: "添加实名信息" })

      Scroll() {
        Column() {
          // 姓名输入
          Row() {
            Text("姓名")
              .fontSize(16)
              .width(80)

            TextInput({ placeholder: "请输入姓名" })
              .width('70%')
              .height(40)
              .onChange((value: string) => {
                this.name = value
              })
          }
          .width('100%')
          .height(60)
          .padding({ left: 16, right: 16 })
          .border({ width: 1, color: '#eeeeee' })

          // 证件类型
          Row() {
            Text("证件类型")
              .fontSize(16)
              .width(80)

            Text("身份证")
              .fontSize(16)
              .width('70%')
          }
          .width('100%')
          .height(60)
          .padding({ left: 16, right: 16 })
          .border({ width: 1, color: '#eeeeee' })

          // 证件号输入
          Row() {
            Text("证件号")
              .fontSize(16)
              .width(80)

            TextInput({ placeholder: "请输入证件号" })
              .width('70%')
              .height(40)
              .onChange((value: string) => {
                this.idNumber = value
              })
          }
          .width('100%')
          .height(60)
          .padding({ left: 16, right: 16 })
          .border({ width: 1, color: '#eeeeee' })

          // 设为默认实名信息
          Row() {
            Toggle({ type: ToggleType.Switch, isOn: this.isDefault })
              .onChange((isOn: boolean) => {
                this.isDefault = isOn
              })

            Text("设为默认实名信息")
              .fontSize(16)
              .margin({ left: 8 })
          }
          .width('100%')
          .height(60)
          .padding({ left: 16, right: 16 })
          .justifyContent(FlexAlign.Start)

          // 协议同意
          Row() {
            Radio({ value: 'agree', group: 'protocol' })
              .checked(this.agreeProtocol)
              .onChange((isChecked: boolean) => {
                this.agreeProtocol = isChecked
              })

            Text("我已阅读并同意")
              .fontSize(14)

            Text("《实名说明》")
              .fontSize(14)
              .fontColor('#1a73e8')
              .onClick(() => {
                console.log("查看实名说明")
              })
          }
          .width('100%')
          .height(50)
          .padding({ left: 16, right: 16 })
          .justifyContent(FlexAlign.Start)

          // 确定按钮
          Button("确定", { type: ButtonType.Capsule })
            .width('90%')
            .height(45)
            .backgroundColor('#ff2442')
            .fontColor(Color.White)
            .margin({ top: 20 })
            .onClick(() => {
              if (this.validateForm()) {
                console.log("表单提交:", {
                  name: this.name,
                  idNumber: this.idNumber,
                  isDefault: this.isDefault
                })
              }
            })
        }.width("100%").alignItems(HorizontalAlign.Start)
      }.width("100%").layoutWeight(1).align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f5f5f5')
  }

  // 表单验证
  private validateForm(): boolean {
    if (!this.name) {
      console.log("请输入姓名")
      return false
    }
    if (!this.idNumber) {
      console.log("请输入证件号")
      return false
    }
    if (!this.agreeProtocol) {
      console.log("请同意实名协议")
      return false
    }
    return true
  }
}
