//
//  ContentView.swift
//  ShouldEat
//
//  Created by sueun kim on 2023/07/11.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationStack(root:{
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home",systemImage: "house")
                    }
                ChatView()
                    .tabItem {
                        Label("Chat", systemImage: "message")
                    }
                LoginPageView()
                    .tabItem{
                        Label("Login",systemImage: "person.crop.circle.fill")
                    }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
