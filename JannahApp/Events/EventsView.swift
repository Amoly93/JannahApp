//
//  EvenntsView.swift
//  JannahApp
//
//  Created by amal badr on 28/01/2024.
//

import SwiftUI

struct EventsView: View {
//    var place:Place
    @StateObject var allData = ViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var city = ["الرياض"]
    @State private  var selectedCity:String = "الرياض"
    var body: some View {
        VStack{
            ZStack{
                
                Image("Group 446")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                
                
                VStack(spacing: 50.0){
                    HStack{
                        Text("الفعاليات")
                            .font(.custom("Helvetica Neue", size: 21).bold())
                        Picker(selection: $selectedCity, label: Text("")) {
                         
                            ForEach(city,id:\.self){
                                Text($0)
                                    .font(.custom("Helvetica Neue", size: 21))
                                    .foregroundColor(Color.colorPrimer)
                             
                            }
                        }
                 
                    }
                    ScrollView( showsIndicators: false) {
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(allData.event,id: \.id) { index in
                                
                                
                                EventsItemView(events: index)

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
            print("oooooo")
            self.allData.getSubcollectionsData()
         
            
            
         
//            self.allData.getEventData(category: "Salon", categoryID: "qMNwPzBg8c9YJM0fwSBC")
            
        }
    }
}
//
//#Preview {
//    EventsView()
//}
