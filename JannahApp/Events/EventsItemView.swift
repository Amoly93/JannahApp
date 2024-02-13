//
//  EventsItemView.swift
//  JannahApp
//
//  Created by amal badr on 28/01/2024.
//

import SwiftUI
import MapKit
struct EventsItemView: View {
    var events:Event
    var body: some View {

            NavigationLink {
                DetailsEventView(events: events, coordinate: CLLocationCoordinate2D(latitude: 24.818577449472762, longitude: 46.618091315341786))
            } label: {
                VStack{
                    AsyncImage(url: URL(string: "\(events.logo)")) { image in
                        image
                            .resizable()
                                              .cornerRadius(5)
                    } placeholder: {
                        Image("logo")
                            .renderingMode(.original)
                                               .resizable()
                                               .cornerRadius(5)
                          
                    }
                    .frame(width: 155 ,height: 155)
                   
                    
                    HStack{
                        Label(events.address, image: "location")
                            .font(.custom("Helvetica Neue", size: 12))
                        ZStack{
                            Capsule()
                                .fill(Color.colorPrimer)
                            Text("شراء التذاكر")
                                .font(.custom("Helvetica Neue", size: 14))
                                .foregroundColor(Color.white)
                            
                        }
                        
                    }
                    .frame(height: 24.0)
                }
                .padding(4)
                .background(Color.white)
                .cornerRadius(15)
            }
        
    }
}

//#Preview {
//    EventsItemView(events: e)
//}
