// LoadingPage.ets
import router from '@ohos.router';
@Entry
@Component
struct LoadingPage {
  @State progress: number = 0
  private timer: number = 0
  private username: string = ''

  onPageShow() {
    // 从路由参数获取用户名
    const params = router.getParams() as Record<string, string>
    this.username = params?.username || ''

    // 模拟加载过程
    this.timer = setInterval(() => {
      if (this.progress < 100) {
        this.progress += 5
      } else {
        clearInterval(this.timer)
        // 加载完成后跳转到首页
        router.replaceUrl({
          url: 'pages/home/HomePage',
          params: { username: this.username }
        })
      }
    }, 200)
  }

  onPageHide() {
    // 清除定时器
    clearInterval(this.timer)
  }

  build() {
    Column() {
      // 加载动画
      LoadingProgress()
        .width(60)
        .height(60)
        .margin({ bottom: 20 })

      // 加载百分比
      Text(`加载中... ${this.progress}%`)
        .fontSize(18)
        .margin({ bottom: 10 })

      // 加载速度模拟
      Text(`速度: ${Math.floor(Math.random() * 500 + 100)} KB/s`)
        .fontSize(14)
        .fontColor('#666')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
