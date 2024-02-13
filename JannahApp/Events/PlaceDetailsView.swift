//
//  PlaceDetailsView.swift
//  JannahApp
//
//  Created by amal badr on 31/01/2024.
//

import SwiftUI
import MapKit
struct PlaceDetailsView: View {
    @StateObject var allData = ViewModel()
    var place:Place
    var categoryItem:Categories
    let url = URL(string: "https://www.google.com")!
    var body: some View {
        VStack{
            ZStack{
                Image("Group 446")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
             
                
          
          
            ScrollView(showsIndicators: false){
             
                    VStack(alignment: .leading, spacing: 15.0){
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
                            .frame( height: 170)
                        HStack{
                            Link(destination: URL(string:place.locationURL)!) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.colorMain)
                                    Label("الاتجاهات", systemImage: "location.fill")
                                        .font(.custom("Helvetica Neue", size: 20))
                                        .foregroundColor(Color.white)
                                        .padding(8)
                                    
                                }
                            }
                          
                            Link(destination: URL(string:place.website) ?? url) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.colorPink)
                                    Label("الموقع الالكتروني", systemImage: "network")
                                        .font(.custom("Helvetica Neue", size: 20))
                                        .foregroundColor(Color.white)
                                        .padding(8)
                                    
                                }
                            }
                            
                        }
                            
                        Text("نبذة عن \(place.name)")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorPrimer)
                        Text(place.description)
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(Color.accentColor)
                        Text("أوقات العمل")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorPrimer)
                        Text(place.workTime)
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(Color.accentColor)
//                        Text("معلومات التواصل")
//                            .font(.custom("Helvetica Neue", size: 19).bold())
//                            .foregroundColor(Color.colorPrimer)
//                        Text("٠٥٧٤٧٤٧٧٦٤")
//                            .font(.custom("Helvetica Neue", size: 18))
//                            .foregroundColor(Color.accentColor)
                        if allData.event.count > 0{
                            VStack(alignment: .leading){
                                Text("الفعاليات")
                                    .font(.custom("Helvetica Neue", size: 19).bold())
                                    .foregroundColor(Color.colorPrimer)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(alignment: .top, spacing:5){
                                        ForEach(allData.event,id: \.id) { index in
                                            
                                            
                                            EventsItemView(events: index)
                                            
                                        }
                                    }
                                    .background(Color.colorGray)
                                }
                                
                            }
                        }
                    

                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)

            }
//            .padding(.top, -150.0)
            .padding()
       
            }

        }
        .background(Color.colorGray)
        .onAppear(){
            if categoryItem.id == 1{
//                self.allData.getPlacesData(category: "Education ")
                self.allData.getEventData(category: "Education ", categoryID: place.id)
            }else if categoryItem.id == 4 {
          
                self.allData.getEventData(category: "Pets", categoryID: place.id)
            }else if categoryItem.id == 2 {
                self.allData.getEventData(category: "Entertainment", categoryID: place.id)
//                self.allData.getPlacesData(category: "Entertainment")
            }else if categoryItem.id == 6{
//                self.allData.getPlacesData(category: "Salon")
                self.allData.getEventData(category: "Salon", categoryID: place.id)
            }else if categoryItem.id == 3 {
                self.allData.getEventData(category: "Sports", categoryID: place.id)
//                self.allData.getPlacesData(category: "Sports")
            }else if categoryItem.id == 5 {
                self.allData.getEventData(category: "Shops", categoryID: place.id)
//                self.allData.getPlacesData(category: "Shops")
            }
          
           
           
        }
    }
}

