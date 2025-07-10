// pages/MyOrder/movie.ets
import router from '@ohos.router';

// 定义电影订单类型
interface MovieOrder {
  id: string;
  title: string;
  time: string;
  seat: string;
  cinema: string;
  image: Resource;
}

@Entry
@Component
struct MoviePage {
  // 使用定义的接口类型
  @State movieOrders: MovieOrder[] = [
    {
      id: '001',
      title: '流浪地球3',
      time: '2025-08-15 14:30',
      seat: '7排12座',
      cinema: '万达影城（北京朝阳店）',
      image: $r('app.media.earth3')
    },
    {
      id: '002',
      title: '封神第二部',
      time: '2025-09-20 19:00',
      seat: '5排8座',
      cinema: 'CGV影城（上海环球港店）',
      image: $r('app.media.god2')
    }
  ];

  build() {
    Column() {
      // 标题栏
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
          .margin({ left: 12, right: 16 })
          .onClick(() => {
            router.back();
          })

        Text('我的电影票')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({ top: 16, bottom: 16 })
      .justifyContent(FlexAlign.Start)

      // 订单列表
      Column() {
        if (this.movieOrders.length > 0) {
          List({ space: 12 }) {
            ForEach(this.movieOrders, (item: MovieOrder) => {
              ListItem() {
                Row() {
                  Image(item.image)
                    .width(80)
                    .height(120)
                    .borderRadius(8)
                    .objectFit(ImageFit.Cover)

                  Column() {
                    Text(item.title)
                      .fontSize(18)
                      .fontWeight(FontWeight.Bold)
                      .margin({ bottom: 6 })

                    Text(`影院：${item.cinema}`)
                      .fontSize(14)
                      .margin({ bottom: 4 })

                    Text(`时间：${item.time}`)
                      .fontSize(14)
                      .margin({ bottom: 4 })

                    Text(`座位：${item.seat}`)
                      .fontSize(14)
                  }
                  .margin({ left: 12 })
                  .alignItems(HorizontalAlign.Start)
                }
                .width('100%')
                .padding(12)
                .backgroundColor(Color.White)
                .borderRadius(12)
                .shadow({ radius: 4, color: '#10000000' })
              }
            })
          }
          .width('100%')
          .layoutWeight(1)
        } else {
          Column() {
            Image($r('app.media.dislike'))
              .width(120)
              .height(120)
              .margin({ bottom: 16 })
            Text('暂无电影票订单')
              .fontSize(16)
              .fontColor('#999999')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }
      }
      .margin({ top: 8 })
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F5F5F5')
  }
}
