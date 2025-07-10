import { CinemaFragment } from './CinemaFragment'
import { FirstLookFragment } from './FirstLookFragment'
import { HomeFragment } from './HomeFragment'
import { MineFragment } from './MineFragment'

@Entry
@Component
struct HomePage {
  @State selectedIndex: number = 0

  @Builder
  myBuilder(index: number, text: string, icon: ResourceStr) {
    Column() {
      Image(icon)
        .width(30).aspectRatio(1).fillColor(index == this.selectedIndex ? Color.Blue : Color.Black)
      Text(text)
        .fontColor(index == this.selectedIndex ? Color.Blue : Color.Black)
    }
  }

  build() {
    Tabs({
      barPosition: BarPosition.End, index: $$this.selectedIndex
    }) {
      TabContent() {
        HomeFragment()
      }
      .tabBar(this.myBuilder(0, "首页", $r('app.media.home_24dp_000000_FILL0_wght400_GRAD0_opsz24')))

      TabContent() {
        CinemaFragment()
      }
      .tabBar(this.myBuilder(1, "影院", $r('app.media.icon_cinema')))

      TabContent() {
        FirstLookFragment()
      }
      .tabBar(this.myBuilder(2, "抢先看", $r('app.media.icon_first_look')))


      TabContent() {
        MineFragment()
      }
      .tabBar(this.myBuilder(3, "个人中心", $r('app.media.person_24dp_000000_FILL0_wght400_GRAD0_opsz24')))

    }
    .animationDuration(0)
    .scrollable(false)
    .height('100%')
    .width('100%')
  }
}