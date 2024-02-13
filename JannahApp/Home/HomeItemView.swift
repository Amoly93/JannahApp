//
//  HomeItemView.swift
//  JannahApp
//
//  Created by amal badr on 28/01/2024.
//

import SwiftUI

struct HomeItemView: View {
    var categoryItem:Categories
  
    var body: some View {
        NavigationLink {
            CategoryDetailsView( categoryItem: categoryItem)
        } label: {
            VStack(spacing: 15.0){
                Image(categoryItem.image)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 80, height: 60)
                
                Text(categoryItem.title)
                    .font(.custom("Helvetica Neue", size: 16).bold())
                    .foregroundColor(Color.white)
                
            }
            .padding(20)
            .frame(width: 150.0)
            .background(categoryItem.color.gradient.shadow(.drop(color: .black, radius: 3, x: -2, y: 2)))
            .cornerRadius(15)
            .shadow(color: Color.gray, radius: 6, x: 5, y: 5)
        }
        


        
    }
}

#Preview {
    HomeItemView(categoryItem: category[0])
}
