// LoginPage.ets
import router from '@ohos.router';
import prompt from '@ohos.prompt';

@Entry
@Component
struct LoginPage {
  @State username: string = ''
  @State password: string = ''

  build() {
    Stack() {
      // 1. 背景图片层
      Image($r('app.media.login_bg'))  // 确保图片在resources/base/media目录下
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)  // 保持图片比例并填满容器

      // 2. 半透明遮罩层（可选，提高文字可读性）
      Row()
        .width('100%')
        .height('100%')
        .backgroundColor('#000000')
        .opacity(0.3)  // 透明度调整

      // 3. 内容层
      Column() {
        // 影院名称
        Text('GG Bond影城')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 50, bottom: 40 })
          .fontColor('#ffffff')  // 文字改为白色

        // 用户名输入框
        TextInput({ placeholder: '请输入用户名/手机号' })
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .backgroundColor('#ffffff')  // 输入框背景设为白色
          .onChange((value: string) => {
            this.username = value
          })

        // 密码输入框
        TextInput({ placeholder: '请输入密码' })
          .width('80%')
          .height(50)
          .type(InputType.Password)
          .margin({ bottom: 20 })
          .backgroundColor('#ffffff')  // 输入框背景设为白色
          .onChange((value: string) => {
            this.password = value
          })

        // 登录按钮
        Button('登录', { type: ButtonType.Capsule })
          .width('80%')
          .height(50)
          .margin({ bottom: 15 })
          .backgroundColor('#ff2442')
          .onClick(() => {
            if (this.username && this.password) {
              router.pushUrl({
                url: 'pages/LoadingPage',
                params: { username: this.username }
              })
            } else {
              prompt.showToast({ message: '请输入用户名和密码' })
            }
          })

        // 注册和忘记密码链接
        Row() {
          Text('注册')
            .fontSize(14)
            .fontColor('#ffffff')  // 文字改为白色
            .margin({ right: 30 })
            .onClick(() => {
              router.pushUrl({ url: 'pages/RegisterPage' })
            })

          Text('忘记密码')
            .fontSize(14)
            .fontColor('#ffffff')  // 文字改为白色
            .onClick(() => {
              router.pushUrl({ url: 'pages/ForgetPasswordPage' })
            })
        }
        .justifyContent(FlexAlign.Center)
        .margin({ top: 15 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
