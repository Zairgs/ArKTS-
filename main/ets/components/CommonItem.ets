@Component
export struct CommonItem {
  leftText: string = ''

  @Builder
  rightBuilder() {
  }

  @BuilderParam right: () => void = this.rightBuilder

  build() {
    Row() {
      Text(this.leftText)
      this.right()
    }.width('100%').padding({ left: 12, right: 12, }).constraintSize({ minHeight: 44 })
  }
}