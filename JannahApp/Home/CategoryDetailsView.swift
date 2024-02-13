//
//  CategoryDetailsView.swift
//  JannahApp
//
//  Created by amal badr on 31/01/2024.
//

import SwiftUI
import MapKit
struct CategoryDetailsView: View {
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
    @ObservedObject var allData = ViewModel()
    var categoryItem:Categories
    var body: some View {
        VStack{
            ZStack{
                
                Image("Group 446")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                
                
                VStack(spacing: 50.0){
                    Text(categoryItem.title)
                        .font(.custom("Helvetica Neue", size: 21).bold())
                    ScrollView( showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(allData.Places, id: \.id) { index in
                              
                                PlaceItemView(place: index, categoryItem: categoryItem)
//                                print("hhhhhhh")
//                                print(index.id)
                              
                            }
                        }
                    }
                    .padding(.horizontal, 16.0)
                }
               
                //            .padding(.top, -120.0)
            }
        }
        .background(Color.colorGray)
        .onAppear(){
            if categoryItem.id == 1{
                self.allData.getPlacesData(category: "Education ")
                
            }else if categoryItem.id == 4 {
                self.allData.getPlacesData(category: "Pets")
            }else if categoryItem.id == 2 {
                self.allData.getPlacesData(category: "Entertainment")
            }else if categoryItem.id == 6{
                self.allData.getPlacesData(category: "Salon")
            
            }else if categoryItem.id == 3 {
                self.allData.getPlacesData(category: "Sports")
            }else if categoryItem.id == 5 {
                self.allData.getPlacesData(category: "Shops")
            }
            
        }

    }
}

//#Preview {
//    CategoryDetailsView( categoryItem: )
//}
