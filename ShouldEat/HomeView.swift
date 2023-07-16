//
//  HomeView.swift
//  ShouldEat
//
//  Created by sueun kim on 2023/07/11.
//

import SwiftUI
enum Cook_Level{
    case one, two, threee, four
    var Cook_Level_Number : String{
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .threee:
            return "3"
        case .four:
            return "4"
        }
    }
    var Cook_Level_Name : String {
        switch self{
        case .one:
            return "간단한 요리"
        case .two:
            return "시간이 걸리는 요리"
        case .threee:
            return "준비가 필요한 요리"
        case .four:
            return "특별한 요리"
        }
    }
    var Cook_Level_BackgroundColor : Color {
        switch self {
        case .one:
            return Color.cyan
        case .two:
            return Color.orange
        case .threee:
            return Color.primary
        case .four:
            return Color.accentColor
        }
    }
    var Cook_Level_Color : Color {
        switch self {
        case .one:
            return Color.green
        case .two:
            return Color.blue
        case .threee:
            return Color.red
        case .four:
            return Color.cyan
        }
    }
    var Cook_Level_Description : String{
        switch self {
        case .one:
            return "누구나 쉽게 요리할 수 있어요"
        case .two:
            return "어렵지는 않지만 시간이 조금 걸려요"
        case .threee:
            return "요리하기전에 필요한 작업이 존재해요"
        case .four:
            return "조금은 어려워요"
        }
    }
}
struct HomeView: View {
    var CookLevel :  [Cook_Level] = [.one,.two,.threee,.four]
    
    let columns = [GridItem(.flexible())]
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path:$path.self){
            ScrollView{
                    CookItem()
            }
        }
    }
    @ViewBuilder
    func CookItem()-> some View{
        @State var level : String = ""
        LazyVGrid(columns: columns) {
            ForEach(CookLevel, id: \.self) { value in
            NavigationLink {
                CookItemView(level: value.Cook_Level_Number, Cook_Level: CookLevel)
            } label: {
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName: "\(value.Cook_Level_Number).circle")
                            .resizable()
                            .foregroundColor(value.Cook_Level_Color)
                            .frame(width:35,height: 35)
                            .offset(x:-5,y: -5)
                        Spacer()
                        Image(systemName: "ellipsis")
                            .foregroundColor(.green)
                    }
                    HStack{
                        Spacer()
                        Text(value.Cook_Level_Name)
                            .font(.title)
                            .foregroundColor(.green)
                            .bold()
                            .padding()
                    }
                    Text(value.Cook_Level_Description)
                        .foregroundColor(.black)
                        .fontWeight(.light)
                        .padding([.leading,.bottom],10)
                }
            }
            .padding()
                .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .shadow(radius:3)
                    )
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
