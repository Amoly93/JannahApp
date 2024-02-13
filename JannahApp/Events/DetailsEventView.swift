//
//  DetailsEventView.swift
//  JannahApp
//
//  Created by amal badr on 28/01/2024.
//

import SwiftUI
import MapKit
import FirebaseAuth

struct DetailsEventView: View {
    var events:Event
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
 
    var body: some View {
        VStack{
            ZStack{
                Image("Group 446")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
             
                
          
          
            ScrollView(showsIndicators: false){
             
                VStack(alignment: .leading, spacing: 15.0){
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
                    .frame( height: 180)
                    
                    VStack(alignment: .leading , spacing: 15.0){
                        Text("لمحة عن الفعالية")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorMain)
                        Text(events.description)
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(Color.accentColor)
                        Text("أوقات الفعالية")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorMain)
                        Text(events.eventTime)
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(Color.accentColor)
                        Text("التذاكر")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorMain)
                        Text("\(events.ticketDetails)")
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(Color.accentColor)
                        Text("العنوان")
                    }
                    .padding(.horizontal)
//                                            Text("الجهة ")
//                                                .font(.custom("Helvetica Neue", size: 19).bold())
//                                                .foregroundColor(Color.colorMain)
//                                            NavigationLink {
//                                                PlaceDetailsView(place: Place, categoryItem: Categories)
//                                            } label: {
//                                                HStack{
//                                                    Text("مركز جود لضيافة الاطفال")
//                                                        .font(.custom("Helvetica Neue", size: 18))
//                                                        .foregroundColor(Color.accentColor)
//                                                    Image(systemName: "info.circle.fill")
//                                                        .foregroundColor(Color.colorPrimer)
//                                                }
//                                            }
//                    
//                    
//                 
//                        .font(.custom("Helvetica Neue", size: 19).bold())
//                        .foregroundColor(Color.colorMain)
                    Link(destination: URL(string:events.locationURL)!) {
                        MapView(events: events)
                            .frame(height: 140.0)
                    }
                      //                            .cornerRadius(10)
//               @available(iOS 17.0, *){
//
//                            Map{
//                                Marker(events.name, coordinate: CLLocationCoordinate2D(latitude: 24.818577449472762, longitude: 46.618091315341786))
//                                    .tint(Color.colorPrimer)
//                            }
//                            .frame(height: 90.0)
//                            .cornerRadius(10)
//                        }
//                        
//                        .padding()
//                    }
                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .padding()
       
            }
 
            NavigationLink {
        
                if(Auth.auth().currentUser?.uid == nil){
                  SignInWithPhoneView()
                }else{
                    TicketView(eventsData: events)
                }
            } label: {
                ZStack{
                    Capsule()
                        .fill(Color.colorPrimer)
                    Text("حجز تذاكر")
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(Color.white)
                    
                } 
            }
            .padding(.horizontal)
            .frame(height: 40)
        }
        .background(Color.colorGray)
        .navigationTitle(events.name)
        .toolbar {
//            FavoriteButton(isSet: true)
        }
       
    }
  
}
struct MapView: UIViewRepresentable {
    var events:Event
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: events.latitude, longitude: events.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
  
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "الفعالية"
        uiView.addAnnotation(annotation)
//        uiView.mapType = .standard
        uiView.setRegion(region, animated: true)
    }
}
//24.818577449472762, 46.618091315341786
//#Preview {
//    DetailsEventView(coordinate: CLLocationCoordinate2D(latitude: 24.818577449472762, longitude: 46.618091315341786))
//}
