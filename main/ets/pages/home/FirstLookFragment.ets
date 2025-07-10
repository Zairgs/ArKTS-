/*@Observed
class VideoBean {
  url: ResourceStr
  id: number
  status: number = 0

  constructor(id: number, url: ResourceStr) {
    this.url = url
    this.id = id
  }
}

@Preview
@Component
export struct FirstLookFragment {
  @State
  dataList: VideoBean[] = [
    new VideoBean(1, $rawfile('video1.mp4')),
    new VideoBean(2, $rawfile('video2.mp4')),
    new VideoBean(3, $rawfile('video3.mp4')),
  ]

  build() {
    Column() {
      Swiper() {
        ForEach(this.dataList, (item: VideoBean) => {
          VideoItemComponent({ item: item })
        })
      }.width("100%").indicator(false).vertical(true)
    }.width("100%").height("100%").backgroundColor(Color.Black)
  }
}

@Component
struct VideoItemComponent {
  @ObjectLink
  item: VideoBean

  build() {
    RelativeContainer() {
      Video({ src: this.item.url })
        .width("100%").height("100%")
        .autoPlay(true)
        .controls(false)
      Column({ space: 10 }) {
        Image($r('app.media.avatar'))
          .width(56)
          .aspectRatio(1)
          .borderRadius(28)
        IconTextComponent({
          icon: this.item.status === 1 ? $r('app.media.favorite_24dp_000000_FILL1_wght400_GRAD0_opsz24') :
          $r('app.media.favorite_24dp_000000_FILL0_wght400_GRAD0_opsz24'),
          text: "4568",
          color: this.item.status === 1 ? Color.Red : Color.White
        }).onClick(() => {
          if (this.item.status === 1) {
            this.item.status = 0
          } else {
            this.item.status = 1
          }
        })

        IconTextComponent({
          icon: $r('app.media.chat_24dp_000000_FILL0_wght400_GRAD0_opsz24'),
          text: "4568"
        }).onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/CommentListPage" })
        })

        IconTextComponent({
          icon: $r('app.media.icon_share'),
          text: "4568"
        })

      }
      .width(56)

      .justifyContent(FlexAlign.Center)
      .height("100%")
      .margin({ right: 12 })
      .alignRules({
        end: {
          anchor: "__container__", align: HorizontalAlign.End
        }
      })

      Text("GG Bond")
        .fontColor(Color.White)
        .alignRules({
          start: {
            anchor: "__container__", align: HorizontalAlign.Start
          },
          bottom: {
            anchor: "__container__", align: VerticalAlign.Bottom
          },
        }).margin({ left: 12, bottom: 12 })

    }.width("100%").height("100%")
  }
}

@Component
struct IconTextComponent {
  @Prop
  icon: ResourceStr = ''
  text: string = ''
  @Prop
  color: ResourceColor = Color.White

  build() {
    Column({ space: 5 }) {
      Image(this.icon).width(56)
        .fillColor(this.color)
        .aspectRatio(1)
      Text(this.text).fontColor(Color.White)
    }.width("100%")
  }
}*/

@Observed
class VideoBean {
  url: ResourceStr
  id: number
  status: number = 0
  avatar: ResourceStr
  likeCount: number = 1234  // 修改初始值
  commentCount: number = 335 // 修改初始值
  shareCount: number = 0
  description: string

  constructor(id: number, url: ResourceStr, avatar: ResourceStr, description: string) {
    this.url = url
    this.id = id
    this.avatar = avatar
    this.description = description
  }
}

@Preview
@Component
export struct FirstLookFragment {
  @State
  dataList: VideoBean[] = [
    new VideoBean(1, $rawfile('video1.mp4'), $r('app.media.myson1'), '这是一段展现自然之美的视频，适合放松时欣赏。'),
    new VideoBean(2, $rawfile('video2.mp4'), $r('app.media.myson2'), '探索城市节奏，记录快节奏生活下的小确幸。'),
    new VideoBean(3, $rawfile('video3.mp4'), $r('app.media.myson3'), '温馨亲情故事短片，带你回味童年的味道。'),
  ]

  @State currentIndex: number = 0

  build() {
    Column() {
      Swiper() {
        ForEach(this.dataList, (item: VideoBean, index: number) => {
          VideoItemComponent({
            item: item,
            isCurrent: this.currentIndex === index
          })
        }, (item: VideoBean) => item.id.toString()) // 仅添加key生成
      }
      .width('100%')
      .indicator(false)
      .vertical(true)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}

@Component
struct VideoItemComponent {
  @ObjectLink item: VideoBean
  @Prop isCurrent: boolean = false

  @State isPlaying: boolean = true
  private videoController: VideoController = new VideoController() // 必须添加的控制器

  // 唯一必要的生命周期添加
  aboutToDisappear() {
    this.videoController.pause()
  }

  build() {
    RelativeContainer() {
      Video({
        controller: this.videoController, // 必须保留的控制器
        src: this.item.url
      })
        .width('100%')
        .height('100%')
        .autoPlay(this.isCurrent && this.isPlaying)
        .controls(false)
        .onClick(() => {
          if (this.isCurrent) {
            this.isPlaying = !this.isPlaying
            this.isPlaying ? this.videoController.start() : this.videoController.pause()
          }
        })

      /* 保持完全相同的UI结构 */
      Column({ space: 10 }) {
        Image(this.item.avatar)
          .width(56).height(56)
          .borderRadius(28)
          .backgroundColor(Color.White)
          .border({ width: 2, color: Color.White })

        IconTextComponent({
          icon: this.item.status === 1 ? $r('app.media.dianzan1') : $r('app.media.dianzan0'),
          text: this.item.likeCount.toString(),
          color: this.item.status === 1 ? Color.Red : Color.White
        }).onClick(() => {
          this.item.status = this.item.status === 1 ? 0 : 1
          this.item.likeCount += this.item.status === 1 ? 1 : -1
        })

        IconTextComponent({
          icon: $r('app.media.commet0'),
          text: this.item.commentCount.toString()
        }).onClick(() => {
          this.item.commentCount++
          const router = this.getUIContext()?.getRouter()
          router?.pushUrl({ url: 'pages/CommentListPage' })
        })

        IconTextComponent({
          icon: $r('app.media.icon_share'),
          text: this.item.shareCount.toString()
        }).onClick(() => {
          this.item.shareCount++
        })
      }
      .width(56)
      .justifyContent(FlexAlign.Center)
      .height('100%')
      .margin({ right: 12 })
      .alignRules({
        end: { anchor: '__container__', align: HorizontalAlign.End }
      })

      Text(this.item.description)
        .fontColor(Color.White)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .alignRules({
          start: { anchor: '__container__', align: HorizontalAlign.Start },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        })
        .margin({ left: 12, bottom: 60 })
    }
    .width('100%')
    .height('100%')
  }
}

// 保持完全相同的IconTextComponent
@Component
struct IconTextComponent {
  @Prop icon: ResourceStr = ''
  @Prop text: string = ''
  @Prop color: ResourceColor = Color.White

  build() {
    Column({ space: 5 }) {
      Image(this.icon).width(56).aspectRatio(1).fillColor(this.color)
      Text(this.text).fontColor(Color.White)
    }
    .width('100%')
  }
}