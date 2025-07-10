// ForgetPasswordPage.ets
import router from '@ohos.router';
import prompt from '@ohos.prompt';

@Entry
@Component
struct ForgetPasswordPage {
  @State phoneNumber: string = ''
  @State verificationCode: string = ''
  @State newPassword: string = ''
  @State countdown: number = 0

  // 获取验证码
  getVerificationCode() {
    if (!this.phoneNumber) {
      prompt.showToast({ message: '请输入手机号' })
      return
    }
    if (!/^1[3-9]\d{9}$/.test(this.phoneNumber)) {
      prompt.showToast({ message: '请输入正确的手机号' })
      return
    }

    this.countdown = 60
    const timer = setInterval(() => {
      if (this.countdown > 0) {
        this.countdown--
      } else {
        clearInterval(timer)
      }
    }, 1000)

    prompt.showToast({ message: '验证码已发送' })
  }

  // 完成重置密码
  completeReset() {
    if (!this.phoneNumber || !this.verificationCode || !this.newPassword) {
      prompt.showToast({ message: '请填写完整信息' })
      return
    }

    prompt.showToast({ message: '密码重置成功' })
    router.back()
  }

  build() {
    Column() {
      Text('忘记密码')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 30 })

      // 手机号输入
      TextInput({ placeholder: '请输入手机号' })
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .type(InputType.Number)
        .maxLength(11)
        .onChange((value: string) => {
          this.phoneNumber = value
        })

      // 验证码输入
      Row() {
        TextInput({ placeholder: '请输入验证码' })
          .width('60%')
          .height(50)
          .margin({ right: 10 })
          .type(InputType.Number)
          .maxLength(6)
          .onChange((value: string) => {
            this.verificationCode = value
          })

        Button(this.countdown > 0 ? `${this.countdown}秒后重试` : '获取验证码')
          .width('40%')
          .height(50)
          .fontColor('#ff2442')
          .backgroundColor(Color.White)
          .borderColor('#ff2442')
          .borderWidth(1)
          .onClick(() => {
            if (this.countdown === 0) {
              this.getVerificationCode()
            }
          })
      }
      .width('80%')
      .margin({ bottom: 15 })

      // 新密码输入
      TextInput({ placeholder: '请设置新密码(6-20位)' })
        .width('80%')
        .height(50)
        .margin({ bottom: 25 })
        .type(InputType.Password)
        .onChange((value: string) => {
          this.newPassword = value
        })

      // 完成按钮
      Button('完成', { type: ButtonType.Capsule })
        .width('80%')
        .height(50)
        .backgroundColor('#ff2442')
        .onClick(() => {
          this.completeReset()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
