import router from '@ohos.router'

@Preview
@Component
export struct MineFragment {
  build() {
    Scroll() {
      Column({ space: 12 }) {
        // User Info Section - Modified layout
        Row() {
          // Left side - User info
          Row({ space: 10 }) {
            Image($r('app.media.avatar'))
              .width(56)
              .aspectRatio(1)
              .borderRadius(28)

            Column({ space: 5 }) {
              Text('饭桶本桶').fontSize(18).fontWeight(FontWeight.Bold)
              Text('钻石VIP').fontSize(14).fontColor('#ffd7af34')
              Text('成长值:80/100').fontSize(12)
              Progress({ value: 80, type: ProgressType.Linear })
                .width('100%')
                .height(6)
            }.alignItems(HorizontalAlign.Start)
          }
          .layoutWeight(1)  // Take remaining space

          // Right side - Setting icon with margin
          Image($r('app.media.setting'))
            .width(24)
            .margin({ right: 12 })
            .onClick(() => {
              router.pushUrl({ url: "pages/SettingPage" })
            })
        }
        .width('100%')
        .padding(12)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .alignItems(VerticalAlign.Center)

        // Stats Section - Modified colors
        Row() {
          Column() {
            Text('8').fontSize(18).fontWeight(FontWeight.Bold).fontColor('#FF6699')
            Text('想看').fontSize(12).fontColor('#FF6699')
          }
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#fffff5f7') // Pink background
          .height('100%')
          .borderRadius({ topLeft: 10, bottomLeft: 10 })

          Divider()
            .vertical(true)
            .height(20)
            .color("#ebebeb")

          Column() {
            Text('5').fontSize(18).fontWeight(FontWeight.Bold).fontColor('#66CCFF')
            Text('看过').fontSize(12).fontColor('#66CCFF')
          }
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#fff0f9ff') // Blue background
          .height('100%')
          .borderRadius({ topRight: 10, bottomRight: 10 })
        }
        .width('100%')
        .height(60)
        .backgroundColor(Color.White)
        .borderRadius(10)

        // Orders Section
        Column({ space: 12 }) {
          Row() {
            Text('我的订单').fontSize(16).fontWeight(FontWeight.Bold)
            Text('全部订单').fontSize(12).margin({ left: 8 })
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)

          Row({ space: 20 }) {
            Column({ space: 5 }) {
              Image($r('app.media.ticket'))
                .width(30)
                .aspectRatio(1)
              Text('电影票').fontSize(12)
            }
            .onClick(() => router.pushUrl({ url: "pages/Movie" }))

            Column({ space: 5 }) {
              Image($r('app.media.performance'))
                .width(30)
                .aspectRatio(1)
              Text('演出娱乐').fontSize(12)
            }
            .onClick(() => router.pushUrl({ url: "pages/Show" }))

            Column({ space: 5 }) {
              Image($r('app.media.movie'))
                .width(30)
                .aspectRatio(1)
              Text('在线观影').fontSize(12)
            }
            .onClick(() => router.pushUrl({ url: "pages/Online" }))

            Column({ space: 5 }) {
              Image($r('app.media.buy'))
                .width(30)
                .aspectRatio(1)
              Text('周边').fontSize(12)
            }
            .onClick(() => router.pushUrl({ url: "pages/Goods" }))
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .width('100%')
        .padding(12)
        .backgroundColor(Color.White)
        .borderRadius(10)

        // Discount Cards Section
        Column({ space: 12 }) {
          Row() {
            Text('我的卡券').fontSize(16).fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)

          Grid() {
            GridItem() {
              Column({ space: 5 }) {
                Text('优惠券').fontSize(14)
                Text('0张可用').fontSize(12).fontColor('#ffd7af34')
              }
              .width('100%')
              .padding(8)
              .backgroundColor('#FFF8E6')
              .borderRadius(8)
              .onClick(() => router.pushUrl({ url: "pages/MyCards/Coupon" }))
            }

            GridItem() {
              Column({ space: 5 }) {
                Text('影城卡').fontSize(14)
                Text('0张可用').fontSize(12).fontColor('#ffd7af34')
              }
              .width('100%')
              .padding(8)
              .backgroundColor('#FFF8E6')
              .borderRadius(8)
              .onClick(() => router.pushUrl({ url: "pages/MyCards/CinemaCard" }))
            }

            GridItem() {
              Column({ space: 5 }) {
                Text('先享卡').fontSize(14)
                Text('0张可用').fontSize(12).fontColor('#ffd7af34')
              }
              .width('100%')
              .padding(8)
              .backgroundColor('#FFF8E6')
              .borderRadius(8)
              .onClick(() => router.pushUrl({ url: "pages/MyCards/MemberCard" }))
            }

            GridItem() {
              Column({ space: 5 }) {
                Text('影城币').fontSize(14)
                Text('0张可用').fontSize(12).fontColor('#ffd7af34')
              }
              .width('100%')
              .padding(8)
              .backgroundColor('#FFF8E6')
              .borderRadius(8)
              .onClick(() => router.pushUrl({ url: "pages/MyCards/Coin" }))
            }
          }
          .columnsTemplate('1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
        }
        .width('100%')
        .padding(12)
        .backgroundColor(Color.White)
        .borderRadius(10)

        // Services Section - Modified to one per row with larger icons
        Column({ space: 12 }) {
          Row() {
            Text('精选服务').fontSize(16).fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)

          Column() {
            ForEach([
              {
                icon: $r('app.media.qiangpiao'),
                title: "我的预约抢票",
                desc: "一键预约 抢票无忧",
                url: "pages/TicketReservation"
              },
              {
                icon: $r('app.media.shenquan'),
                title: "影城神券",
                desc: "领券下单 立省百元",
                url: "pages/CouponPage"
              },
              {
                icon: $r('app.media.xinxi'),
                title: "观演人信息",
                desc: "管理实名 地址信息",
                url: "pages/RealNameInfoPage"
              },
              {
                icon: $r('app.media.piaogen'),
                title: "我的票根",
                desc: "电子收藏 永久纪念",
                url: "pages/DigitalTicketAlbum"
              },
              {
                icon: $r('app.media.huiyuan'),
                title: "会员特享",
                desc: "尊享体验 帧绮映画",
                url: "pages/VIPPage"
              },
              {
                icon: $r('app.media.more'),
                title: "更多商品",
                desc: "多种选择 双向礼遇",
                url: "pages/MoreGoodsPage"
              }
            ], (item: ServiceBean) => {
              Row({ space: 12 }) {
                Image(item.icon)
                  .width(80)
                  .height(80)// Larger icon size
                  .aspectRatio(1)
                Column({ space: 4 }) {
                  Text(item.title)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                  Text(item.desc)
                    .fontSize(12)
                    .fontColor('#666666')
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .width('100%')
              .padding(12)
              .backgroundColor('#F7F8FA')
              .borderRadius(8)
              .margin({ bottom: 8 })
              .onClick(() => {
                router.pushUrl({ url: item.url })
              })
            })
          }
        }
        .width('100%')
        .padding(12)
        .backgroundColor(Color.White)
        .borderRadius(10)
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .scrollBarColor(Color.Gray)
    .scrollBarWidth(4)
  }
}

interface ServiceBean {
  icon: ResourceStr
  title: string
  desc: string
  url: string
}
