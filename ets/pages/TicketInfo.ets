// TicketInfo.ets (配套的数据模型类)
export class TicketInfo {
  id: string = ''
  title: string = ''
  location: string = ''
  showTime: string = ''
  price: string = ''
  saleTime: number = 0

  constructor(title: string, location: string, showTime: string, price: string, saleTime: number) {
    this.id = Math.random().toString(36).substring(2)
    this.title = title
    this.location = location
    this.showTime = showTime
    this.price = price
    this.saleTime = saleTime
  }
}
