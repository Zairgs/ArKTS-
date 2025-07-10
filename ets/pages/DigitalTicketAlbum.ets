import router from '@ohos.router'
import AppBar from '../components/AppBar'

@Entry
@Component
struct DigitalTicketAlbum {
  @State activeTab: string = 'movie' // 'movie' 或 'show'

  build() {
    Column() {
      AppBar({ title: "我的数字纪念" })

      Scroll() {
        Column() {
          // 品牌标识
          Text("GG Bond")
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 16, bottom: 24 })
            .width('100%')
            .textAlign(TextAlign.Center)

          // 数字纪念票夹标题
          Text("数字纪念票夹")
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 16, bottom: 16 })
            .width('100%')
            .textAlign(TextAlign.Start)

          // 合成角色组合卡片
          Column() {
            Text("合成角色组合")
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Text("领取《哪吒2》专属【冠军票根】")
              .fontSize(14)
              .margin({ bottom: 16 })

            Button("去领取", { type: ButtonType.Capsule })
              .width(120)
              .height(36)
              .backgroundColor('#ff2442')
              .fontColor(Color.White)
          }
          .width('90%')
          .padding(16)
          .backgroundColor('#ffffff')
          .borderRadius(12)
          .margin({ left: '5%', right: '5%', bottom: 24 })

          // 用户信息
          Text("username")
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 16, bottom: 8 })
            .width('100%')
            .textAlign(TextAlign.Start)

          // 标签栏
          Row() {
            Text("赠领记录")
              .fontSize(14)
              .margin({ right: 24 })

            Text("票根订单")
              .fontSize(14)
          }
          .width('100%')
          .padding({ left: 16, bottom: 16 })

          // 票根统计
          Row() {
            Text("纪念票：")
              .fontSize(14)

            Text("电影待收藏")
              .fontSize(14)
              .fontColor('#ff2442')
              .margin({ right: 16 })

            Text("演出待收藏")
              .fontSize(14)
              .fontColor('#ff2442')
          }
          .width('100%')
          .padding({ left: 16, bottom: 16 })

          // 选项卡
          Row() {
            Button("电影", { type: ButtonType.Normal })
              .width('50%')
              .height(48)
              .backgroundColor(this.activeTab === 'movie' ? '#ff2442' : '#f5f5f5')
              .fontColor(this.activeTab === 'movie' ? Color.White : '#333333')
              .onClick(() => { this.activeTab = 'movie' })

            Button("演出", { type: ButtonType.Normal })
              .width('50%')
              .height(48)
              .backgroundColor(this.activeTab === 'show' ? '#ff2442' : '#f5f5f5')
              .fontColor(this.activeTab === 'show' ? Color.White : '#333333')
              .onClick(() => { this.activeTab = 'show' })
          }
          .width('100%')

          // 内容区域
          if (this.activeTab === 'movie') {
            this.movieContent()
          } else {
            this.showContent()
          }
        }.width("100%")
      }.width("100%").layoutWeight(1)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f5f5f5')
  }

  @Builder
  movieContent() {
    Column() {
      // 暂无票根提示
      Column() {
        Image($r('app.media.dislike'))
          .width(80)
          .height(80)
          .margin({ bottom: 16 })

        Text("暂未获得数字票根")
          .fontSize(16)
          .margin({ bottom: 8 })

        Button("领取数字票根", { type: ButtonType.Capsule })
          .width(160)
          .height(36)
          .backgroundColor('#ff2442')
          .fontColor(Color.White)
      }
      .width('100%')
      .padding({ top: 40, bottom: 40 })

      // 活动推荐
      Text("以下影片正参与购票领数字票根活动，快来试试吧哼哼~")
        .fontSize(14)
        .margin({ left: 16, top: 16, bottom: 16 })
        .width('100%')

      // 活动卡片1
      Column() {
        Row() {
          Image($r('app.media.p1'))
            .width(80)
            .height(80)
            .borderRadius(8)
            .margin({ right: 12 })

          Column() {
            Text("时光之镜·中外经典影片展")
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button("参加活动", { type: ButtonType.Capsule })
              .width(100)
              .height(30)
              .backgroundColor('#ff2442')
              .fontColor(Color.White)
              .fontSize(12)
          }
        }

        Text("购票解锁纪念票根")
          .fontSize(14)
          .margin({ top: 8 })
      }
      .width('90%')
      .padding(16)
      .backgroundColor('#ffffff')
      .borderRadius(12)
      .margin({ left: '5%', right: '5%', bottom: 16 })

      // 活动卡片2
      Column() {
        Row() {
          Image($r('app.media.p3'))
            .width(80)
            .height(80)
            .borderRadius(8)
            .margin({ right: 12 })

          Column() {
            Text("              恶意                     ")
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button("参加活动", { type: ButtonType.Capsule })
              .width(100)
              .height(30)
              .backgroundColor('#ff2442')
              .fontColor(Color.White)
              .fontSize(12)
          }
        }

        Text("9.5分购票评分")
          .fontSize(14)
          .margin({ top: 8 })
      }
      .width('90%')
      .padding(16)
      .backgroundColor('#ffffff')
      .borderRadius(12)
      .margin({ left: '5%', right: '5%', bottom: 16 })

      // 活动卡片3
      Column() {
        Row() {
          Image($r('app.media.p2'))
            .width(80)
            .height(80)
            .borderRadius(8)
            .margin({ right: 12 })

          Column() {
            Text("       侏罗纪世界：重生      ")
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })

            Button("参加活动", { type: ButtonType.Capsule })
              .width(100)
              .height(30)
              .backgroundColor('#ff2442')
              .fontColor(Color.White)
              .fontSize(12)
          }
        }

        Text("8.6分购票评分")
          .fontSize(14)
          .margin({ top: 8 })
      }
      .width('90%')
      .padding(16)
      .backgroundColor('#ffffff')
      .borderRadius(12)
      .margin({ left: '5%', right: '5%', bottom: 16 })
    }
  }

  @Builder
  showContent() {
    Column() {
      // 暂无票根提示
      Column() {
        Image($r('app.media.dislike'))
          .width(80)
          .height(80)
          .margin({ bottom: 16 })

        Text("暂未获得数字票根")
          .fontSize(16)
          .margin({ bottom: 8 })

        Button("领取数字票根", { type: ButtonType.Capsule })
          .width(160)
          .height(36)
          .backgroundColor('#ff2442')
          .fontColor(Color.White)
      }
      .width('100%')
      .padding({ top: 40, bottom: 40 })
    }
  }
}
