// pages/Goods/Goods.ets
import router from '@ohos.router';

// 定义订单状态类型
type OrderStatus = 'pending' | 'paid' | 'shipped' | 'completed' | 'after_sale';

// 定义订单数据类型
interface Order {
  id: string;
  goodsName: string;
  price: number;
  coverImage: Resource;
  status: OrderStatus;
  createTime: string;
  count: number;
}

@Entry
@Component
struct GoodsPage {
  @State topSelectedIndex: number = 0;
  @State bottomSelectedIndex: number = 0;
  @State orders: Order[] = [];

  // 分类数据
  private topCategories: string[] = [
    '影周边',
    '演出影展周边',
    '商城',
    '数字藏品'
  ];

  private bottomCategories: string[] = [
    '全部',
    '待支付',
    '待发货',
    '待收货',
    '售后'
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

        Text('周边')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .margin({ top: 16, bottom: 16 })
      .justifyContent(FlexAlign.Start)

      // 顶部分类导航
      Scroll() {
        Row() {
          ForEach(this.topCategories, (item: string, index: number) => {
            Text(item)
              .fontSize(16)
              .fontColor(this.topSelectedIndex === index ? '#FF0000' : '#333333')
              .padding(12)
              .border({
                width: this.topSelectedIndex === index ? { bottom: 2 } : 0,
                color: this.topSelectedIndex === index ? { bottom: '#FF0000' } : undefined
              })
              .onClick(() => {
                this.topSelectedIndex = index;
                this.bottomSelectedIndex = 0;
              })
          })
        }
        .padding(8)
      }
      .height(48)

      // 底部分类导航
      Scroll() {
        Row() {
          ForEach(this.bottomCategories, (item: string, index: number) => {
            Text(item)
              .fontSize(14)
              .fontColor(this.bottomSelectedIndex === index ? '#FF0000' : '#666666')
              .padding(8)
              .margin({ right: 10 })
              .borderRadius(16)
              .backgroundColor(this.bottomSelectedIndex === index ? '#FFF5F5' : '#F5F5F5')
              .onClick(() => {
                this.bottomSelectedIndex = index;
              })
          })
        }
        .padding(8)
      }
      .height(40)
      .backgroundColor('#FAFAFA')

      // 内容区域
      Column() {
        if (this.orders.length > 0) {
          List() {
            ForEach(this.orders, (item: Order) => {
              ListItem() {
                // 订单项内容
              }
            })
          }
        } else {
          Column() {
            Image($r('app.media.dislike'))
              .width(120)
              .height(120)
              .margin({ bottom: 16 })
            Text('暂无订单')
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
    .padding(12)
    .backgroundColor('#FFFFFF')
  }

  // 获取状态文本
  private getStatusText(status: OrderStatus): string {
    const statusMap: Record<OrderStatus, string> = {
      'pending': '待支付',
      'paid': '待发货',
      'shipped': '待收货',
      'completed': '已完成',
      'after_sale': '售后中'
    };
    return statusMap[status];
  }
}
