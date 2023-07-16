//
//  CookItemView.swift
//  ShouldEat
//
//  Created by sueun kim on 2023/07/12.
//

import SwiftUI

struct CookItemView: View {
    var level : String
    var Cook_Level : [Cook_Level]
    var body: some View {
        VStack{
            if level == "1"{
                level1()
            }
            else if level == "2"{
                level2()
            }
            else if level == "3"{
                level3()
            }
            else if level == "4"{
                level4()
            }
        }
    }
    @ViewBuilder
    func level1()-> some View{
        VStack{
           Text("11111")
        }
    }
    @ViewBuilder
    func level2()-> some View{
           Text("2222")
    }
    
    @ViewBuilder
    func level3()-> some View{
           Text("3333")
    }
    
    @ViewBuilder
    func level4()-> some View{
        VStack{
            Text("44444")
        }
    }
}
