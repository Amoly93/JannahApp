//
//  ContentView.swift
//  JannahApp
//
//  Created by amal badr on 28/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    enum Tab {
        case home
        case event
        case favorite
    }
    var body: some View {
        NavigationStack{
            TabView(selection: $selection) {
                Group{
                    HomeView()
                        .tabItem{
                            Label("الرئيسية", systemImage: "house.fill")
                                .foregroundColor(Color.colorMain)
                        }
                        .tag(Tab.home)
                    EventsView()
                        .tabItem{
                            Label("الفعاليات", systemImage: "ticket")
                                .foregroundColor(Color.colorMain)
                        }
                        .tag(Tab.event)
//              FavoriteView()
//                        .tabItem {
//                            Label("مفضلتي", systemImage: "heart.fill")
//                                .foregroundColor(Color.colorMain)
//                        }
//                        .tag(Tab.favorite)

                }
              
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.colorGray, for: .tabBar)
      
         
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
