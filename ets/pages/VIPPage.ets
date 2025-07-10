import AppBar from '../components/AppBar'
import { CommonItem } from '../components/CommonItem'
import { HorizontalDivider } from '../components/MyDivider'
import router from '@ohos.router'

@Entry
@Component
struct VIPPage {
  @State isAutoRenew: boolean = true
  @State isExclusiveOn: boolean = true

  build() {
    Column() {
      AppBar({ title: "会员特享" })

      Scroll() {
        Column() {
          // 会员等级 - 修改为使用right函数返回文本
          CommonItem({
            leftText: "我的会员等级",
            right: () => Text("钻石VIP")
          })
          HorizontalDivider()

          // 会员有效期 - 修改为使用right函数返回文本
          CommonItem({
            leftText: "有效期至",
            right: () => Text("2025-12-31")
          })
          HorizontalDivider()

          // 会员权益
          CommonItem({ leftText: "会员权益说明" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/VIPBenefitsPage'
              })
            })
          HorizontalDivider()

          // 专属折扣
          CommonItem({ leftText: "专属折扣" }) {
            Row() {
              Toggle({ isOn: $$this.isExclusiveOn, type: ToggleType.Switch })
                .onChange((isOn: boolean) => {
                  this.isExclusiveOn = isOn
                })
            }.layoutWeight(1).justifyContent(FlexAlign.End)
          }
          HorizontalDivider()

          // 自动续费
          CommonItem({ leftText: "自动续费" }) {
            Row() {
              Toggle({ isOn: $$this.isAutoRenew, type: ToggleType.Switch })
                .onChange((isOn: boolean) => {
                  this.isAutoRenew = isOn
                })
            }.layoutWeight(1).justifyContent(FlexAlign.End)
          }
          HorizontalDivider()

          // 会员专享片库
          CommonItem({ leftText: "专享片库" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ExclusiveLibraryPage'
              })
            })
          HorizontalDivider()

          // 会员购票优惠
          CommonItem({ leftText: "购票折扣" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/TicketDiscountPage'
              })
            })
          HorizontalDivider()

          // 生日特权
          CommonItem({ leftText: "生日特权" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/BirthdayPrivilegePage'
              })
            })
          HorizontalDivider()

          // 会员活动
          CommonItem({ leftText: "专属活动" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/VIPEventsPage'
              })
            })
          HorizontalDivider()
        }.width("100%").alignItems(HorizontalAlign.Start)
      }.width("100%").layoutWeight(1).align(Alignment.TopStart)
    }
    .height('100%')
    .width('100%')
  }
}
