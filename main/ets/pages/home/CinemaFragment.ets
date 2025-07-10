@Preview
@Component
export struct CinemaFragment {
  build() {
    Scroll() {
      Column() {
        AdComponent()
        CinemaListComponent()
      }.width("100%").alignItems(HorizontalAlign.Start)
    }.width("100%").height("100%").align(Alignment.TopStart)

  }
}

@Component
struct AdComponent {
  @State
  dataList: ResourceStr[] = [
    $r('app.media.yingyuanbeijing1'),
    $r('app.media.yingyuanbeijing2'),
    $r('app.media.yingyuanbeijing3')
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

interface CinemaBean {
  title: ResourceStr
  address: ResourceStr
  price: number
  status: number
}

@Component
struct CinemaListComponent {
  @State
  dataList: CinemaBean[] = [
    {
      title: "艾欧尼亚影城（科大店）",
      address: "未央区未央湖街道武德路华鑫天悦城 5 层",
      price: 59.9,
      status: 1
    },
    {
      title: "沃美影城龙湖未央天街店（杜比全景声店）",
      address: "未央区景云路龙湖西安未央天街 6 层",
      price: 65.0,
      status: 1
    },
    {
      title: "万达影城（乐派广场杜比全景声店）",
      address: "未央区渭滨路乐派生活广场 7 层",
      price: 49.9,
      status: 0
    },
    {
      title: "花田大戏院",
      address: "未央区正则路开元路十字西南角花田里街区东区 3F",
      price: 45.0,
      status: 1
    },
    {
      title: "UME 影城（浐灞砂之船奥莱店）",
      address: "灞桥区世博东路 5001 号砂之船奥特莱斯 4 楼\n",
      price: 55.0,
      status: 2
    },
    {
      title: "中影时代国际影城（旭弘店）",
      address: "未央区明光路与凤城六路十字旭景兴园东门",
      price: 39.9,
      status: 1
    },
    {
      title: "百老汇影城（南京德基广场店）",
      address: "江苏省南京市玄武区中山路18号德基广场7层",
      price: 69.9,
      status: 1
    },
    {
      title: "西安 CineMaple 红叶巨幕激光影城",
      address: "未央区凤城四路中登广场三楼",
      price: 52.0,
      status: 0
    },
    {
      title: "万达影城（大明宫万达广场 IMAX ）",
      address: "未央区太华北路 369 号万达广场 2 号门 4 层",
      price: 48.0,
      status: 1
    },
    {
      title: "奥斯卡陆港国际影城（陆港店）",
      address: "灞桥区浐灞国际港港务大道与秦汉大道交汇处",
      price: 42.5,
      status: 3
    }
  ]

  build() {
    List() {
      ForEach(this.dataList, (item: CinemaBean) => {
        ListItem() {
          Row({ space: 5 }) {
            Column({ space: 5 }) {
              Text(item.title)
              Text(item.address)
              Row({ space: 5 }) {
                Text('退').borderWidth(1).borderColor(Color.Gray)
                Text('4K影厅').borderWidth(1).borderColor(Color.Gray)
              }
            }.layoutWeight(1).alignItems(HorizontalAlign.Start)

            Column({ space: 5 }) {
              Text(`${item.price}`).fontColor(Color.Red)
              Stack() {
                Text(item.status === 1 ? '已预约' : '预约').fontColor(Color.White)
              }
              .height(24)
              .borderRadius(12).padding({ left: 6, right: 6 })
              .backgroundColor(item.status === 1 ? "#808080" : "#F3BA43")
            }
          }.width("100%").padding(12)
        }.width("100%")
      })
    }.width("100%").height("100%").layoutWeight(1).divider({ color: "#ebebeb", strokeWidth: 1 })
  }
}