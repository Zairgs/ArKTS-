// RegisterPage.ets
import router from '@ohos.router';
import prompt from '@ohos.prompt';

@Entry
@Component
struct RegisterPage {
  @State phoneNumber: string = ''
  @State verificationCode: string = ''
  @State password: string = ''
  @State countdown: number = 0
  @State agreed: boolean = false

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

  // 注册
  register() {
    if (!this.phoneNumber || !this.verificationCode || !this.password) {
      prompt.showToast({ message: '请填写完整信息' })
      return
    }
    if (!this.agreed) {
      prompt.showToast({ message: '请同意隐私协议' })
      return
    }

    // 模拟注册成功
    prompt.showToast({ message: '注册成功' })
    router.back()
  }

  build() {
    Column() {
      Text('注册账号')
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

      // 密码输入
      TextInput({ placeholder: '请设置密码(6-20位)' })
        .width('80%')
        .height(50)
        .margin({ bottom: 15 })
        .type(InputType.Password)
        .onChange((value: string) => {
          this.password = value
        })

      // 隐私协议
      Row() {
        Checkbox()
          .select(this.agreed)
          .onChange((isChecked: boolean) => {
            this.agreed = isChecked
          })
          .margin({ right: 8 })

        Text('我已阅读并同意')
          .fontSize(12)
          .fontColor('#666')

        Text('《用户协议》')
          .fontSize(12)
          .fontColor('#ff2442')
          .onClick(() => {
            // 跳转到用户协议页面
            prompt.showToast({ message: '查看用户协议' })
          })

        Text('和')
          .fontSize(12)
          .fontColor('#666')

        Text('《隐私政策》')
          .fontSize(12)
          .fontColor('#ff2442')
          .onClick(() => {
            // 跳转到隐私政策页面
            prompt.showToast({ message: '查看隐私政策' })
          })
      }
      .width('80%')
      .margin({ bottom: 20 })

      // 注册按钮
      Button('注册', { type: ButtonType.Capsule })
        .width('80%')
        .height(50)
        .backgroundColor('#ff2442')
        .onClick(() => {
          this.register()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
