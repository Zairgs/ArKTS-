import AppBar from '../components/AppBar';

export interface ArticleComments {
  id: number
  articleId: number
  createTime: string
  content: string
}

@Entry
@Component
struct CommentListPage {
  @State inputText: string = '';
  @State
  commentList: ArticleComments  [] = []
  private textInputController: TextInputController = new TextInputController()

  aboutToAppear(): void {
    this.getUIContext().setKeyboardAvoidMode(1)
  }

  aboutToDisappear(): void {
    this.getUIContext().setKeyboardAvoidMode(0)
  }

  async send() {
    if (this.inputText.length === 0) {
      this.getUIContext().getPromptAction().showToast({ message: "请输入内容" })
      return
    }
    this.commentList.push({
      id: Date.now(),
      articleId: 0,
      createTime: "2025-07-09",
      content: this.inputText
    })
    this.getUIContext().getPromptAction().showToast({ message: "发表成功" })
    this.textInputController.stopEditing()
    this.inputText = ''
  }

  build() {
    Column() {
      AppBar({ title: "评论列表" })
      List() {
        ForEach(this.commentList, (item: ArticleComments) => {
          ListItem() {
            Column({ space: 12 }) {
              Row({ space: 8 }) {
                Image(``)
                  .width(36)
                  .alt($r('app.media.startIcon'))
                  .aspectRatio(1)
                  .borderRadius(18)
                  .objectFit(ImageFit.Cover)
                Text(`xxx`)
                  .fontColor(Color.Black)
                  .fontSize(16)
              }.width("100%")

              Text(`${item.content}`)
                .fontColor(Color.Black)
                .fontSize(16)
                .padding({ left: 44 })

              Text(`${item.createTime}`)
                .fontColor(Color.Gray)
                .fontSize(12)
                .padding({ left: 44 })

            }.width("100%").alignItems(HorizontalAlign.Start).padding({ top: 12, bottom: 12 })
          }
        })
      }
      .width("100%")
      .height('auto')
      .layoutWeight(1)
      .divider({ strokeWidth: 1, color: "#ebebeb" })
      .scrollBar(BarState.Off)

      Row() {
        TextInput({ placeholder: "请说点啥吧...", text: $$this.inputText, controller: this.textInputController })
          .layoutWeight(1)
        Row().width(12)
        Button("发送").enabled(this.inputText.length > 0).onClick(() => {
          this.send()
        })
      }.width('100%').padding(12)
    } .height('100%')
    .width('100%')
  }
}