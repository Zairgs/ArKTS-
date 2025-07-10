import { TicketInfo } from './TicketInfo'
import router from '@ohos.router';
@Entry
@Component
struct TicketReservation {
  @State currentTime: number = new Date().getTime()
  @State tickets: TicketInfo[] = [
    new TicketInfo(
      "《爱·永恒》理查德·克莱德曼钢琴音乐会西安站",
      "西安 曲江大礼堂",
      "2026.1.18 19:30 周日",
      "￥380起",
      new Date(2025, 6, 12, 11, 0, 0).getTime()// 开抢时间: 2025-07-09 11:00
    ),
    new TicketInfo(
      "2025马克西姆'边界'古典跨界钢琴演奏会-西安站",
      "西安 曲江大礼堂",
      "2025.11.29 19:30 周六",
      "￥380起",
      new Date(2025, 6, 12, 11, 0, 0).getTime()// 开抢时间: 2025-07-09 11:00
    )
  ]

  aboutToAppear() {
    // 每秒更新一次当前时间，用于倒计时
    setInterval(() => {
      this.currentTime = new Date().getTime()
    }, 1000)
  }

  build() {
    Column() {
      // 顶部标题栏（包含返回按钮和标题）
      Row() {
        // 返回图标
        Image($r('app.media.back')) // 使用image0作为返回图标
          .width(24)
          .height(24)
          .margin({ left: 16, right: 8 })
          .onClick(() => {
            // 返回上一页的逻辑
            router.back();
          })

        // 标题
        Column() {
          Text("今日必抢")
            .fontSize(24)
            .fontWeight(FontWeight.Bold)

          Text("07 10")
            .fontSize(16)
        }
        .margin({ left: 8 })

        Blank() // 占位空间，使标题居中
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ top: 20, bottom: 20 })

      // 票务列表
      List({ space: 20 }) {
        ForEach(this.tickets, (ticket: TicketInfo) => {
          ListItem() {
            this.ticketItem(ticket)
          }
        }, (ticket: TicketInfo) => ticket.id)
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }

  @Builder
  ticketItem(ticket: TicketInfo) {
    Column() {
      // 演出标题
      Text(ticket.title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 })
        .width('100%')

      // 演出地点
      Text(ticket.location)
        .fontSize(14)
        .margin({ bottom: 4 })
        .width('100%')

      // 演出时间
      Text(ticket.showTime)
        .fontSize(14)
        .margin({ bottom: 12 })
        .width('100%')

      // 价格和倒计时
      Row() {
        Text(ticket.price)
          .fontSize(16)
          .fontColor('#ff0000')

        Blank()

        Column() {
          // 动态倒计时
          Text(this.formatCountdown(ticket.saleTime))
            .fontSize(14)
            .fontColor('#ff0000')

          Text(this.getSaleTimeText(ticket.saleTime))
            .fontSize(12)
        }
      }
      .width('100%')
      .margin({ bottom: 16 })

      // 预约按钮
      Button("去预约", { type: ButtonType.Capsule })
        .width('60%')
        .height(40)
        .backgroundColor('#ff0000')
        .fontColor(Color.White)
    }
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .width('90%')
    .margin({ left: '5%', right: '5%' })
  }

  // 格式化倒计时显示
  private formatCountdown(saleTime: number): string {
    const diff = saleTime - this.currentTime
    if (diff <= 0) {
      return "00天00时00分00秒"
    }

    const days = Math.floor(diff / (1000 * 60 * 60 * 24))
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60))
    const seconds = Math.floor((diff % (1000 * 60)) / 1000)

    return `${this.padZero(days)}天${this.padZero(hours)}时${this.padZero(minutes)}分${this.padZero(seconds)}秒`
  }

  // 补零函数
  private padZero(num: number): string {
    return num < 10 ? `0${num}` : `${num}`
  }

  // 获取开抢时间文本
  private getSaleTimeText(saleTime: number): string {
    const saleDate = new Date(saleTime)
    const now = new Date(this.currentTime)

    // 判断是否是今天、明天或后天
    if (saleDate.getDate() === now.getDate() && saleDate.getMonth() === now.getMonth() &&
      saleDate.getFullYear() === now.getFullYear()) {
      return `今天${this.padZero(saleDate.getHours())}:${this.padZero(saleDate.getMinutes())}开抢`
    }

    const tomorrow = new Date(now)
    tomorrow.setDate(tomorrow.getDate() + 1)
    if (saleDate.getDate() === tomorrow.getDate() && saleDate.getMonth() === tomorrow.getMonth() &&
      saleDate.getFullYear() === tomorrow.getFullYear()) {
      return `明天${this.padZero(saleDate.getHours())}:${this.padZero(saleDate.getMinutes())}开抢`
    }

    const dayAfterTomorrow = new Date(now)
    dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2)
    if (saleDate.getDate() === dayAfterTomorrow.getDate() && saleDate.getMonth() === dayAfterTomorrow.getMonth() &&
      saleDate.getFullYear() === dayAfterTomorrow.getFullYear()) {
      return `后天${this.padZero(saleDate.getHours())}:${this.padZero(saleDate.getMinutes())}开抢`
    }

    return `${saleDate.getFullYear()}.${saleDate.getMonth() +
      1}.${saleDate.getDate()} ${this.padZero(saleDate.getHours())}:${this.padZero(saleDate.getMinutes())}开抢`
  }
}
