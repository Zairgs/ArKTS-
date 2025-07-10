// pages/MemberCard/MemberCardPage.ets
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

interface HelpItem {
  question: string;
  answer: string;
}

@Entry
@Component
struct MemberCardPage {
  @State showHelpDialog: boolean = false;
  @State cardBalance: string = '¥0.00';
  @State showTransactionDetail: boolean = false;
  @State activeTab: number = 0; // 0=全部，1=收入，2=支出

  private helpItems: HelpItem[] = [
    {
      question: 'Q：什么是先享卡？',
      answer: 'A：先享卡是由xxxx有限公司发行的预付卡系列产品，是xxxx以特定载体和形式发行的，可用于在GG Bond影城App经营页面上购买商品或服务的预付价值。'
    },
    {
      question: 'Q：先享卡可以在哪些App使用？',
      answer: 'A：先享卡支持在GG Bond影城微信小程序、GG Bond影城App、美团APP、大众点评APP使用。'
    },
    {
      question: 'Q：先享卡可以在GG Bond影城的哪些业务使用？',
      answer: 'A：全国通用先享卡：可用于购买GG Bond影城电影在线选座业务的电影票、影城会员卡、小吃卖品及演出服务，演出服务包含：话剧.......'
    },
    {
      question: 'Q：如何绑定先享卡？',
      answer: 'A：在GG Bond影城App中，进入"我的"-"先享卡"页面，点击"立即绑卡"按钮，按照提示输入卡号和密码即可完成绑定。'
    },
    {
      question: 'Q：先享卡有有效期吗？',
      answer: 'A：先享卡自激活之日起有效期为3年，请在有效期内使用。'
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
        Text('先享卡')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(56)
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center)

      // 主页面内容
      Column() {
        if (!this.showTransactionDetail) {
          // 卡片信息页面
          Scroll() {
            Column({ space: 12 }) {
              // 卡片信息区
              Column({ space: 12 }) {
                // 余额信息
                Row() {
                  Text('先享卡余额')
                    .fontSize(16)
                  Blank()
                  Text(this.cardBalance)
                    .fontSize(18)
                    .fontColor('#FF0000')
                }
                .width('100%')

                // 操作入口
                Row({ space: 24 }) {
                  Text('使用帮助')
                    .fontSize(14)
                    .onClick(() => {
                      this.showHelpDialog = true
                    })

                  Text('查看交易明细 >')
                    .fontSize(14)
                    .fontColor('#0066CC')
                    .onClick(() => {
                      this.showTransactionDetail = true
                    })
                }
                .width('100%')
              }
              .width('100%')
              .padding(12)
              .backgroundColor(Color.White)
              .borderRadius(10)

              // 服务信息
              Column({ space: 8 }) {
                Text('先享卡服务由')
                  .fontSize(12)
                  .fontColor('#999999')
                Text('客服电话（xxxx）：666666')
                  .fontSize(12)
                Text('服务时间：8:30-21:30')
                  .fontSize(12)
                Text('企业采购热线：123456789')
                  .fontSize(12)
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
          .layoutWeight(1)

          // 底部固定操作区
          Column() {
            Text('绑定先享卡，即视为阅读并同意《先享卡章程》')
              .fontSize(12)
              .fontColor('#999999')
              .margin({ bottom: 8 })

            Button('立即绑卡')
              .width('100%')
              .height(40)
              .backgroundColor('#FF0000')
              .fontColor(Color.White)
              .onClick(() => promptAction.showToast({ message: '跳转绑卡流程' }))
          }
          .width('100%')
          .padding(12)
          .backgroundColor(Color.White)
        } else {
          // 交易明细页面
          Column() {
            // 顶部标题栏
            Row() {
              Image($r('app.media.back'))
                .width(24)
                .height(24)
                .margin({ right: 16 })
                .onClick(() => {
                  this.showTransactionDetail = false
                })

              Text('先享卡明细')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
            }
            .width('100%')
            .padding(12)
            .backgroundColor(Color.White)

            // 分类Tab
            Row({ space: 24 }) {
              Text('全部')
                .fontSize(14)
                .fontColor(this.activeTab === 0 ? '#FF0000' : '#666666')
                .onClick(() => { this.activeTab = 0 })

              Text('收入')
                .fontSize(14)
                .fontColor(this.activeTab === 1 ? '#FF0000' : '#666666')
                .onClick(() => { this.activeTab = 1 })

              Text('支出')
                .fontSize(14)
                .fontColor(this.activeTab === 2 ? '#FF0000' : '#666666')
                .onClick(() => { this.activeTab = 2 })
            }
            .width('100%')
            .padding(12)
            .backgroundColor(Color.White)
            .border({ width: 1, color: '#EEEEEE' })

            // 空状态
            Column() {
              Image($r('app.media.dislike'))
                .width(120)
                .height(120)
                .margin({ bottom: 16 })

              Text('暂无记录')
                .fontSize(16)
                .fontColor('#999999')
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
          }
          .width('100%')
          .height('100%')
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F8F8F8')

      // 帮助弹窗
      if (this.showHelpDialog) {
        // 半透明遮罩
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('#000000')
          .opacity(0.5)
          .onClick(() => {
            this.showHelpDialog = false
          })

        // 弹窗内容
        Column({ space: 12 }) {
          Text('使用帮助')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 12 })

          Scroll() {
            Column({ space: 16 }) {
              ForEach(this.helpItems, (item: HelpItem) => {
                Column({ space: 8 }) {
                  Text(item.question)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .width('100%')
                  Text(item.answer)
                    .fontSize(14)
                    .width('100%')
                }
                .width('100%')
                .padding(8)
              })
            }
            .width('100%')
          }
          .height(300)
          .width('100%')
          .margin({ top: 12, bottom: 12 })

          Button('关闭')
            .width(120)
            .margin({ bottom: 12 })
            .onClick(() => {
              this.showHelpDialog = false
            })
        }
        .width('80%')
        .height('60%')
        .backgroundColor(Color.White)
        .borderRadius(10)
        .position({ x: '10%', y: '15%' })
        .zIndex(99)
      }
    }
    .width('100%')
    .height('90%')
  }
}