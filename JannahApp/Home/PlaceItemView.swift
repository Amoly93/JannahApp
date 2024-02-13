//
//  PlaceItemView.swift
//  JannahApp
//
//  Created by amal badr on 31/01/2024.
//

import SwiftUI

struct PlaceItemView: View {
    var place:Place
//    @StateObject var allData = ViewModel()
    var categoryItem:Categories
    var body: some View {
    
        NavigationLink {
            PlaceDetailsView(place: place, categoryItem: categoryItem)
        } label: {
            VStack{
                AsyncImage(url: URL(string: "\(place.logo)")) { image in
                    image
                        .resizable()
                                          .cornerRadius(5)
                } placeholder: {
                    Image("logo")
                        .renderingMode(.original)
                                           .resizable()
                                           .cornerRadius(5)
                      
                }
                .frame(width: 155, height: 155)
//                Image(place.logo)
//                    .renderingMode(.original)
//                    .resizable()
//                    .frame(width: 155, height: 155)
//                    .cornerRadius(5)
                
                HStack{
                    Label(place.address, image: "location")
                        .font(.custom("Helvetica Neue", size: 12))
             
                    
                }
                .frame(height: 24.0)
            }
            .padding(4)
            .background(Color.white)
            .cornerRadius(15)
        }
//        .onAppear(){
//          
//                self.allData.getEducationPlacesData()
//                print("hhhhhhhhhh")
//            }
//        }
    }
}

//#Preview {
//    PlaceItemView(place: Place(id: "String", logo: "String", name: "String", website: "String", locationURL: "String", description: "String", workTime: "String", address: "String"))
//}
