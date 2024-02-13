//
//  TicketView.swift
//  JannahApp
//
//  Created by amal badr on 30/01/2024.
//

import SwiftUI

//struct BoxView: View {
//    var box: Event
//  @Binding var selectedBtn: String  // 3
//  var body: some View{
//    Button(action: {
//        self.selectedBtn = self.box.timeList
//    }){
//        Text(box.timeList.map({ x in
//            x.       }))
//            .foregroundColor(self.selectedBtn == self.box.timeList ? Color.white : Color.accentColor)
//       .font(.custom("Helvetica Neue", size: 16))
//    }
//    .frame(width: 110, height: 40)
//    .background(self.selectedBtn == self.box.id ? Color.colorPrimer : Color.colorGray)
//    .cornerRadius(15)
//    .padding(0)
//  }
//}
struct TicketView: View {
    var eventsData:Event
    @State private var count: Int = 1
    @State private var date = Date.now

    func dateRange(sYear:Int ,sMonth:Int,sDay:Int,eYear:Int,eMonth:Int,eDay:Int) -> ClosedRange<Date> {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: sYear, month: sMonth, day: sDay)
        let endComponents = DateComponents(year: eYear, month:eMonth, day: eDay)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }
    @State private  var selectedKind:String = ""
    var price:String = ""
    @State private var show = false
    @ObservedObject var allData = ViewModel()
    var body: some View {
        VStack{
            ZStack{
                Image("Group 446")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
             
                
          
          
            ScrollView(showsIndicators: false){
             
                    VStack(alignment: .leading, spacing: 24.0){
                           Text("١- اختر اليوم")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorMain)
                        DatePicker("Enter your birthday", selection: $date,in: dateRange(sYear:eventsData.startEvent[0], sMonth: eventsData.startEvent[1], sDay: eventsData.startEvent[2], eYear: eventsData.endEvent[0], eMonth: eventsData.endEvent[1], eDay: eventsData.endEvent[2]),displayedComponents: [.date])
                                      .datePickerStyle(GraphicalDatePickerStyle())
//                                      .labelsHidden()
                                      .environment(\.locale, Locale(identifier: "ar"))
                                      .frame(maxHeight: 400)
                      
                   
                        Text("٢- اختر الوقت")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorMain)
                        Picker("", selection: $selectedKind) {
                            ForEach(eventsData.timeList,id:\.self){
                                Text($0)
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .foregroundStyle(Color.accentColor)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
//                        ScrollView(.horizontal,showsIndicators: false){
//                              HStack{
//                                  ForEach(eventsData.timeList, id: \.self) { box in
//                                      Text(box)
////                                  BoxView(box: box, selectedBtn: self.$selected)  // 2
//                                }
//                              }
//                            }
                      
                        Text("٣- اختر عدد التذاكر")
                            .font(.custom("Helvetica Neue", size: 19).bold())
                            .foregroundColor(Color.colorMain)
                    
                           
                         
                                
                        HStack(spacing: 19.0){
                            Spacer()
                            Stepper("\(count) ", value: $count,in: 1...eventsData.ticketCount)
                                .font(.custom("Helvetica Neue", size: 19))
                                .accentColor(.colorMain)
                                .foregroundColor(.colorMain)
                            
                        }
                            .background(Color.colorGray)
                            .cornerRadius(15)
                      
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)

            }
//            .padding(.top, -150.0)
            .padding()
       
            }
            NavigationLink {
              Confirm()
            } label: {
                HStack(spacing: 16.0){
                    VStack{
                        
                        Text("\(count * eventsData.ticketPrice) ريال")
                            .font(.custom("Helvetica Neue", size: 20).bold())
                            .foregroundColor(Color.accentColor)
                        Text("مع الضريبة")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(Color.accentColor)
                    }
                    Button {
                      
                        allData.ticket.total = price
                        allData.ticket.name = eventsData.name
                        allData.ticket.date = date.description
                        allData.updateData(update: allData.ticket)
                        self.show = true
                   
                    } label: {
                        ZStack{
                            Capsule()
                                .fill(Color.colorPrimer)
                            Text("شـــــراء ")
                                .font(.custom("Helvetica Neue", size: 20))
                                .foregroundColor(Color.white)
                            
                        }
                    }
                    .frame(height: 80)
                    .navigationDestination(isPresented: $show) {
                     Confirm()
                    }
              
                  
                }
            }
            .padding(.horizontal)
            .frame(height: 40)
        }
        .background(Color.colorGray)
       
    }
    
}

//#Preview {
//    TicketView()
//}
