//
//  HomeView.swift
//  ShouldEat
//
//  Created by sueun kim on 2023/07/11.
//

import SwiftUI

struct HomeView: View {
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
        LazyVGrid(columns: columns) {

            ForEach(CookLevel, id: \.self) { value in
            NavigationLink {
                Text("")
            } label: {
                VStack{
                    HStack{
                        Image(systemName: "\(value.Cook_Level_Number).circle")
                            .resizable()
                            .foregroundColor(value.Cook_Level_Color)
                            .frame(width: 25,height: 25)
                            .offset(x:-20,y:-48)
                        Image("ImageTest")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 80,height: 80)
                            .aspectRatio(contentMode: .fit)
                            .offset(x:-20)
                        Text(value.Cook_Level_Name)
                            .font(.system(size:30))
                            .foregroundColor(value.Cook_Level_Color)
                            .bold()
                        Spacer()
                    }.padding()
                    Text(value.Cook_Level_Description)
                        .bold()
                }
            }
                .padding()
                .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.white)
                            .shadow(radius: 1)
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
