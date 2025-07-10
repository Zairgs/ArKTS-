import AppBar from '../components/AppBar';
import { LengthMetrics } from '@kit.ArkUI';

interface MovieBean {
  icon: ResourceStr
  title: ResourceStr
  director: ResourceStr
  star: ResourceStr
  status: number
  tags: string[]
}

@Entry
@Component
struct RankPage {
  @State dataList: MovieBean[] = [
    {
      icon: $r('app.media.weihefangbaodui'),
      title: "维和防暴队",
      status: 1,
      tags: ['2024', '大陆', '动作'],
      director: "李达超",
      star: "黄景瑜、王一博、钟楚曦"
    },
    {
      icon: $r('app.media.fengshen'),
      title: "封神第二部",
      status: 1,
      tags: ['2024', '大陆', '神话'],
      director: "乌尔善",
      star: "费翔、黄渤、于适"
    },
    {
      icon: $r('app.media.relaguntang'),
      title: "热辣滚烫",
      status: 1,
      tags: ['2024', '大陆', '喜剧'],
      director: "贾玲",
      star: "贾玲、雷佳音、张小斐"
    },
    {
      icon: $r('app.media.liulangdiqiu'),
      title: "流浪地球3",
      status: 0,
      tags: ['2024', '大陆', '科幻'],
      director: "郭帆",
      star: "吴京、刘德华、李雪健"
    },
    {
      icon: $r('app.media.jiangyuannong'),
      title: "酱园弄",
      status: 1,
      tags: ['2024', '大陆', '悬疑'],
      director: "陈可辛",
      star: "章子怡、雷佳音、杨幂"
    },
    {
      icon: $r('app.media.zhiyuanjun'),
      title: "志愿军：雄兵出击2",
      status: 1,
      tags: ['2024', '大陆', '战争'],
      director: "陈凯歌",
      star: "辛柏青、朱一龙、张子枫"
    },
    {
      icon: $r('app.media.shediaoyingxiongzhuan'),
      title: "射雕英雄传：侠之大者",
      status: 1,
      tags: ['2024', '大陆', '武侠'],
      director: "徐克",
      star: "肖战、庄达菲、梁家辉"
    },
    {
      icon: $r('app.media.jiemi'),
      title: "解密",
      status: 0,
      tags: ['2024', '大陆', '谍战'],
      director: "张艺谋",
      star: "张译、于和伟、秦海璐"
    },
    {
      icon: $r('app.media.nezha'),
      title: "哪吒之魔童闹海",
      status: 1,
      tags: ['2024', '大陆', '动画'],
      director: "饺子",
      star: "吕艳婷、囧森瑟夫"
    },
    {
      icon: $r('app.media.haiguanzhanxian'),
      title: "海关战线",
      status: 1,
      tags: ['2024', '香港', '警匪'],
      director: "邱礼涛",
      star: "张学友、谢霆锋、林嘉欣"
    }
  ];
  colors: ResourceColor[] = [
    "#FF5959",
    "#FE9147",
    "#FADE4E",
    "#4AA3FF"
  ]

  build() {
    Column() {
      AppBar({ title: "排行榜" })
      List({ space: 12 }) {
        ForEach(this.dataList, (item: MovieBean, index) => {
          ListItem() {
            Row({ space: 10 }) {
              Stack({ alignContent: Alignment.TopStart }) {
                Image(item.icon).width('100%').height('100%')
                if (index < 4) {
                  Text(`${index + 1}`)
                    .width(20)
                    .textAlign(TextAlign.Center)
                    .fontColor(Color.White)
                    .position({x:10})
                    .backgroundColor(this.colors[index%this.colors.length])
                }
              }.width(100).height('100%').borderRadius(10).clip(true)

              Column() {
                Text(item.title)
                Text(`导演：${item.director}`)
                Text(`主演：${item.star}`)
                Flex({
                  space: {
                    main: LengthMetrics.vp(5),
                    cross: LengthMetrics.vp(5),
                  }
                }) {
                  ForEach(item.tags, (tag: string) => {
                    Text(tag)
                      .borderRadius(2)
                      .padding(4)
                      .fontColor("#8E5F64")
                      .backgroundColor('#FCECEF')
                  })
                }
              }.layoutWeight(1)
              .height('100%')
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.SpaceBetween)
            }.width('100%').height(150)
          }.width('100%').padding({ left: 12, right: 12 })
        })
      }.width("100%").height('100%').layoutWeight(1)
    }
    .height('100%')
    .width('100%')
  }
}