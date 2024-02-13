//
//  Confirm.swift
//  JannahApp
//
//  Created by amal badr on 31/01/2024.
//

import SwiftUI

struct Confirm: View {
    var body: some View {
        ZStack{
            Image("Group 446")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                VStack(alignment: .center, spacing: 150.0){
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .padding(.top)
                        .foregroundStyle(.colorPrimer)
                        .frame(width: 100.0, height: 100.0)
                    Spacer()
                    Text("تم الحجز سيتم التواصل معك ")
                        .font(.custom("Helvetica Neue", size: 24).bold())
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.accentColor)
                    Spacer()
                }
           

                NavigationLink {
//                        if !grade.isEmpty{
//                        }else{
//
//                        }
                ContentView()
                 
               
                } label: {
                    Text("الصفحة الرئيسية")
                        .padding()
                        .font(.custom("Helvetica Neue", size: 19).bold())
                        .foregroundStyle(.white)
                        .background(Color.colorPrimer)
                        .cornerRadius(15)
                        .frame( height: 50)
                }
                .frame(height: 80)
            }
            .padding(.horizontal, 16.0)
            .padding(.vertical, 100.0)
        }
  
     
        .ignoresSafeArea(.all)
    }
}

#Preview {
    Confirm()
}
