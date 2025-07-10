import AppBar from '../components/AppBar'
import { CommonItem } from '../components/CommonItem'
import { HorizontalDivider } from '../components/MyDivider'
import router from '@ohos.router'

@Entry
@Component
struct MoreGoodsPage {
  @State isAutoRenew: boolean = false
  @State isRecommendOn: boolean = true

  build() {
    Column() {
      AppBar({ title: "更多商品" })

      Scroll() {
        Column() {
          // VIP会员专区
          CommonItem({ leftText: "VIP会员" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/VIPMembershipPage'
              })
            })
          HorizontalDivider()

          // 优惠券中心
          CommonItem({ leftText: "优惠券中心" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/CouponCenterPage'
              })
            })
          HorizontalDivider()

          // 观影套餐
          CommonItem({ leftText: "观影套餐" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/MoviePackagePage'
              })
            })
          HorizontalDivider()

          // 周边商城
          CommonItem({ leftText: "周边商城" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/PeripheralShopPage'
              })
            })
          HorizontalDivider()

          // 自动续费开关
          CommonItem({ leftText: "自动续费" }) {
            Row() {
              Toggle({ isOn: $$this.isAutoRenew, type: ToggleType.Switch })
                .onChange((isOn: boolean) => {
                  this.isAutoRenew = isOn
                })
            }.layoutWeight(1).justifyContent(FlexAlign.End)
          }
          HorizontalDivider()

          // 商品推荐开关
          CommonItem({ leftText: "个性化推荐" }) {
            Row() {
              Toggle({ isOn: $$this.isRecommendOn, type: ToggleType.Switch })
                .onChange((isOn: boolean) => {
                  this.isRecommendOn = isOn
                })
            }.layoutWeight(1).justifyContent(FlexAlign.End)
          }
          HorizontalDivider()

          // 购买记录
          CommonItem({ leftText: "购买记录" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/PurchaseHistoryPage'
              })
            })
          HorizontalDivider()

          // 礼品卡
          CommonItem({ leftText: "礼品卡" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/GiftCardPage'
              })
            })
          HorizontalDivider()

          // 帮助中心
          CommonItem({ leftText: "帮助中心" })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/HelpCenterPage'
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
