//
//  ContentView.swift
//  trySomething
//
//  Created by User22 on 2021/3/3.
//

import SwiftUI



struct Riddle{
    let question : String
    let answer : String
    let selection : [String]
}

var riddles = [
    Riddle(question: "長的少，短的多，腳去踩，手去摸", answer: "梯子",selection:["筷子","電梯","梯子","尺"]),
    Riddle(question: "看看沒有，摸摸倒有，似冰不化，似水不流", answer: "鏡子",selection:["鏡子","書櫃","梳子","架子"]),
    Riddle(question: "兩姐妹，一樣長，酸甜苦辣她先嚐(提示:日常用品)", answer: "筷子",selection:["剪刀","筷子","指甲剪","開山刀"]),
    Riddle(question: "在家臉上白，出門臉上花，遠近都能到，一去不回家", answer: "信",selection:["筆記本","信","書","卡片"]),
    Riddle(question: "身小力不小，團結又勤勞。有時搬糧食，有時挖地道。", answer: "螞蟻",selection:["螳螂","蠶","螞蟻","蚊子"]),
    Riddle(question: "說馬不像馬，路上沒有它。若用它做藥，要到海中抓。", answer: "海馬",selection:["螃蟹","蝦子","鯊魚","海馬"]),
    Riddle(question: "黑臉包丞相，坐在大堂上。扯起八卦旗，專拿飛天將。", answer: "蜘蛛",selection:["黑豹","蜘蛛","臺灣黑熊","烏賊"]),
    Riddle(question: "吃進的是草，擠出的是寶。捨己為人類，功勞可不小", answer: "奶牛",selection:["奶牛","豬","狗","馬"]),
    Riddle(question: "百姐妹，千姐妹，同床睡，各蓋被", answer: "石榴",selection:["葡萄","番茄","玉米","石榴"]),
    Riddle(question: "左手五個，左手五個。拿去十個，還剩十個", answer: "手套",selection:["襪子","手套","帽子","毛巾"]),
    Riddle(question: "一物生得巧，地位比人高。戴上御風寒，脫下有禮貌", answer: "帽子",selection:["帽子","毛巾","鞋子","樓梯"]),
    Riddle(question: "屋裡一座亭，亭中有個人，天天盪鞦韆，不盪就有病", answer: "鐘擺",selection:["手錶","鐘擺","手機","汽車"]),
    Riddle(question: "頭上亮光光，出門就成雙。背上縛繩子，馱人走四方", answer: "皮鞋",selection:["襪子","手套","皮鞋","菜刀"]),
]

func start(){
    riddles.shuffle()
}
struct ContentView: View {
    @State var CountForQuestion = 0
    @State var isStart=false
    @State var playingSelection = ["","","",""]
    @State var point = 0
    var body : some View{
        if self.isStart && CountForQuestion<10{
            PlayingView(point : $point,CountForQuestion: $CountForQuestion )
        }
        else if self.isStart == false{
            ZStack{
                Image("images")
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("icon")
                        .resizable()
                        .frame(width: 300, height:300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("元宵猜燈謎")
                        .foregroundColor(Color.yellow)
                        .frame(width: 400.0, height: 100)
                        .background(Color.gray)
                        .font(.system(size: 60))
                        .cornerRadius(60)
                    Button(action: {
                            self.isStart = true
                            start()}) {
                        Text("開始遊戲")
                            .frame(width: 200, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.yellow)
                            .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 40))
                            .cornerRadius(35)
                            
                        }
                }
                .padding(.bottom, 300.0)
                
            }
        }
        else{
            endView(isStart: $isStart,CountForQuestion: $CountForQuestion,point : $point)
        }
    }
}

struct endView : View {
    @Binding var isStart : Bool
    @Binding var CountForQuestion :Int
    @Binding var point : Int
    var body :some View{
        ZStack{
            Image("images")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack{
                Text("J束了")
                    .frame(width: 200.0, height: 100)
                    .background(Color.gray)
                    .foregroundColor(Color.yellow)
                    .alignmentGuide(VerticalAlignment.center) { _ in
                            220
                        }
                    .font(.system(size:60))
                    .cornerRadius(60)
                Text("你共答對了:\(point)題")
                    .font(.system(size:40))
                    .cornerRadius(60)
                Button(action: {
                        self.isStart = true
                        start()
                        CountForQuestion = 0
                        point = 0
                }) {
                    Text("再一次")
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow)
                        .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system(size:40))
                        .cornerRadius(60)
                    }
            }
        }
    }
}

struct PlayingView:View {
    @Binding var point : Int
    @Binding var CountForQuestion :Int
    var body: some View{
        ZStack{
            Image("images")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
            VStack{
                Text("第\(CountForQuestion+1)題")
                    .background(Color.gray)
                    .foregroundColor(Color.yellow)
                    .frame(width: 200.0, height: 100)
                    .alignmentGuide(VerticalAlignment.center) { _ in
                            220
                        }
                    .font(.system(size:40))
                Text("\(riddles[CountForQuestion].question)")
                    .font(.system(size:40))
                    .fontWeight(.bold)
                    .frame(width: 400, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(hue: 0.949, saturation: 1.0, brightness: 0.526))
                    .background(Color(red: 255/255,
                                      green: 255/255, blue: 255/255,opacity: 0.5))
                    .cornerRadius(60)
                Button(action: {
                    if riddles[CountForQuestion].selection[0] == riddles[CountForQuestion].answer{
                        point += 1
                    }
                    CountForQuestion = CountForQuestion + 1
                }) {
                    Text("\(riddles[CountForQuestion].selection[0])")
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow)
                        .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system(size:40))
                        .cornerRadius(60)
                        
                    }
                Button(action: {
                    if riddles[CountForQuestion].selection[1] == riddles[CountForQuestion].answer{
                        point += 1
                    }
                    CountForQuestion = CountForQuestion + 1
                }) {
                    Text("\(riddles[CountForQuestion].selection[1])")
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow)
                        .foregroundColor(Color.blue)
                        .font(.system(size:40))
                        .cornerRadius(40)
                    }
                Button(action: {
                    if riddles[CountForQuestion].selection[2] == riddles[CountForQuestion].answer{
                        point += 1
                    }
                    CountForQuestion = CountForQuestion + 1
                }) {
                    Text("\(riddles[CountForQuestion].selection[2])")
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow)
                        .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system(size:40))
                        .cornerRadius(60)
                    }
                Button(action: {
                    if riddles[CountForQuestion].selection[3] == riddles[CountForQuestion].answer{
                        point += 1
                    }
                    CountForQuestion = CountForQuestion + 1
                }) {
                    Text("\(riddles[CountForQuestion].selection[3])")
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow)
                        .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.system(size:40))
                        .cornerRadius(60)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
