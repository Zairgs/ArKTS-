
@Component
export default struct AppBar {
  @Prop title: string
  appBarHeight: number = 48

  @Builder
  rightBuilder() {
  }

  @BuilderParam right: () => void = this.rightBuilder

  build() {
    Row() {
      Image($r("app.media.arrow_back_ios_new_24dp_000000_FILL1_wght400_GRAD0_opsz24"))
        .width(this.appBarHeight)
        .padding(12)
        .aspectRatio(1)
        .onClick(() => {
          this.getUIContext().getRouter().back()
        })

      Text(this.title)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)

      Stack() {
        this.right()
      }
      .height('100%')
      .aspectRatio(1)
    }
    .width('100%')
    .height(this.appBarHeight)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
  }
}