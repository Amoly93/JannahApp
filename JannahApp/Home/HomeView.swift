//
//  HomeView.swift
//  JannahApp
//
//  Created by amal badr on 28/01/2024.
//

import SwiftUI

struct HomeView: View {
    var data = category
    
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
    var body: some View {
        VStack(spacing: 33.0){
            Image("logo")
                .resizable()
                .frame(width: 100, height: 70)
            Text("مرحباً بك في دليلك لعالم طفلك!")
                .foregroundColor(Color.colorPrimer)
                .font(.custom("Helvetica Neue", size: 20).bold())
            ScrollView( showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data,id:\.id) { index in
                        HomeItemView(categoryItem: index)
                    }
                }
            }
            .padding(.horizontal, 16.0)
        }
        .background(Color.colorGray)
//        VStack{
//            Image("")
//            Text("مرحباً بك في دليلك لعالم طفلك!")
//                .foregroundColor(Color.colorPrimer)
//                .font(.custom("Helvetica Neue", size: 20).bold())
//            Spacer()
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(alignment: .top, spacing:20){
//                    ForEach(data,id:\.id) { index in
//                        HomeItemView(categoryItem: index)
//                        
//                    }
//                }
//            }
////            .padding(.horizontal, 16.0)
//            Spacer()
//        }
//        .background(Color.colorGray)
    
    }
     
}

#Preview {
    HomeView()
}
