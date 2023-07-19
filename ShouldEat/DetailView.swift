//
//  DetailView.swift
//  ShouldEat
//
//  Created by sueun kim on 2023/07/20.
//

import SwiftUI

struct DetailView: View {
    @State var DetailCookImage : String = "https://recipe1.ezmember.co.kr/cache/recipe/2023/07/10/7642a53970f3489974e8eb63069062481_m.jpg"
    @State var Level : String = "초보"
    @State var CookName : String = "마늘 볶음밥"
    @State var Material : [String] = ["참기름","국간장","계란","파스타 면"]
     
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: DetailCookImage)) { image in
                image.resizable()
                    .frame(height:300)
                    .cornerRadius(20)
                    .padding()
            } placeholder: {
                ProgressView()
            }
            HStack{
                Group{
                    Text("Level : \(Level)")
                    Text(CookName)
                }
                .foregroundColor(.white)
                .font(.system(size: 30))
                .padding()
            }.background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.green)
                    .frame(width:365,height: 80)
                )
            Text("준비물")
                    .font(.system(size:25))
            ForEach(Material,id:\.self){ require in
                    Text("• \(require)")
                    .font(.system(size:25))
            }
            Spacer()
            Button {
                print("요리가 시작되었습니다.")
            } label: {
                Text("요리 시작!")
                    .font(.system(size:35))
                    .foregroundColor(.black)
                    .frame(width:300,height: 60)
                    .background(.brown)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
            }

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
