@Preview
@Component
export struct HomeFragment {
  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text('📍武德路')
        AdComponent()
        FuncComponent()
        Text('热门电影')
        HotMovieComponent()
      }.width("100%").alignItems(HorizontalAlign.Start).padding(12)
    }.width("100%").height("100%").align(Alignment.TopStart).backgroundColor("#f8f8f8")

  }
}

@Component
struct AdComponent {
  @State
  dataList: ResourceStr[] = [
    $r('app.media.ey'),
    $r('app.media.kenan'),
    $r('app.media.wuming')
  ]

  build() {
    Column() {
      Swiper() {
        ForEach(this.dataList, (item: ResourceStr) => {
          Image(item)
        })
      }.autoPlay(true)
    }.width("100%").height(200).borderRadius(10).clip(true)
  }
}

interface FuncBean {
  icon: ResourceStr
  text: ResourceStr
  url: string
}

@Component
struct FuncComponent {
  @State
  dataList: FuncBean[] = [
    {
      icon: $r('app.media.x6'),
      text: "电影院",
      url: ""
    },
    {
      icon: $r('app.media.x5'),
      text: "演出｜玩乐",
      url: ""
    },
    {
      icon: $r('app.media.x2'),
      text: "演唱会",
      url: ""
    },
    {
      icon: $r('app.media.x1'),
      text: "脱口秀",
      url: ""
    },
    {
      icon: $r('app.media.x7'),
      text: "排行榜",
      url: "pages/RankPage"
    },
    {
      icon: $r('app.media.x4'),
      text: "景点门票",
      url: ""
    },
    {
      icon: $r('app.media.x8'),
      text: "放映厅",
      url: ""
    },
    {
      icon: $r('app.media.x3'),
      text: "唱跳RAP",
      url: ""
    },
  ]

  build() {
    Column() {
      Grid() {
        ForEach(this.dataList, (item: FuncBean) => {
          GridItem() {
            Column({ space: 5 }) {
              Image(item.icon).width(48).aspectRatio(1)
              Text(item.text).fontSize(14)
            }.width("100%")
          }.onClick(() => {
            if (item.url.length > 0) {
              this.getUIContext().getRouter().pushUrl({ url: item.url })
            }

          })
        })
      }.columnsTemplate("1fr 1fr 1fr 1fr").rowsGap(12)
    }
    .width("100%")
    .backgroundColor(Color.White)
    .borderRadius(10)
    .alignItems(HorizontalAlign.Start)
    .padding(12)
  }
}

interface MovieBean {
  icon: ResourceStr
  title: ResourceStr
  status: number
}

@Component
struct HotMovieComponent {
  @State
  dataList: MovieBean[] = [
    {
      icon: $r('app.media.weihefangbaodui'),
      title: "维和防爆队",
      status: 1
    },
    {
      icon: $r('app.media.guzhuyizhi'),
      title: "孤注一掷",
      status: 0
    },
    {
      icon: $r('app.media.gouzhen'),
      title: "狗阵",
      status: 0
    },
    {
      icon: $r('app.media.eyi'),
      title: "恶意",
      status: 1
    },
    {
      icon: $r('app.media.mingzhentankenan'),
      title: "名侦探柯南：独眼的残像",
      status: 0
    },
    {
      icon: $r('app.media.wumingzhibei'),
      title: "无名之辈",
      status: 0
    },
  ]

  build() {
    Column() {
      Grid() {
        ForEach(this.dataList, (item: MovieBean) => {
          GridItem() {
            Column({ space: 5 }) {
              Image(item.icon).width('100%').aspectRatio(1 / 1.5).borderRadius(10)
              Text(item.title).fontSize(14)
              Stack() {
                Text(item.status === 1 ? '已预约' : '预约').fontColor(Color.White)
              }
              .height(24)
              .borderRadius(12).padding({ left: 6, right: 6 })
              .backgroundColor(item.status === 1 ? "#808080" : "#F3BA43")
            }.width("100%")
          }
        })
      }.columnsTemplate("1fr 1fr 1fr").rowsGap(12).columnsGap(12)
    }
    .width("100%")
    .backgroundColor(Color.White)
    .borderRadius(10)
    .alignItems(HorizontalAlign.Start)
    .padding(12)
  }
}