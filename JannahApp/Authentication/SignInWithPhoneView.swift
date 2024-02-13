//
//  SignInWithPhoneView.swift
//  JannahApp
//
//  Created by amal badr on 31/01/2024.
//

import SwiftUI
import FirebaseAuth
struct SignInWithPhoneView: View {
    @State private var phone = ""
    @State private var msg = ""
    @State private var showingAlert = false
    @State private var show = false
    @State private var verificationID = ""
    @State var Error: String = ""
    var body: some View {
        ZStack{
            
            Image("Group 446")
                .resizable()
                .edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 20.0){
                Spacer()
                Text("تسجيل الدخول")
                    .font(.custom("Helvetica Neue", size: 24).bold())
                    .foregroundStyle(Color.accentColor)
                Spacer()
                Text("أدخل رقم جوال")
                    .font(.custom("Helvetica Neue", size: 19))
                    .foregroundStyle(Color.accentColor)
                HStack{
                    TextField("", text: $phone)
                        .keyboardType(.numberPad)
                    Text("🇸🇦 +966")
                    
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 14.0/*@END_MENU_TOKEN@*/)
                
                .background(Color.colorGray)
                Spacer()
                
                Button{
//                    self.show = true
                    self.sendVerificationCode()
                    
                    
                } label: {
                    Label("تسجيل دخول", systemImage: "")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding()
                        .font(.custom("Helvetica Neue", size: 21).bold())
                        .foregroundStyle(.white)
                        .background(.colorPrimer)
                        .cornerRadius(15)
                }
                .navigationDestination(isPresented:$show) {
//                    TicketView()
                    OTPVerificationView(phone: $phone)
                }
                .alert("Error", isPresented: $showingAlert) {
                    Button("Cancel", role: .cancel, action: {})
                } message: {
                    Text(Error)
                }

                        Spacer()
                //              .navigationDestination(isPresented: Binding<Bool>, destination: <#T##() -> View#>)
            }
            .padding(.horizontal, 16.0)
        }
    }
    func sendVerificationCode(){
        let phoneNumber = "+966\(phone)"
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
              if let error = error {
                  print(error.localizedDescription)
                  self.msg = (error.localizedDescription)
                  Error = error.localizedDescription
                 showingAlert = true
                return
              }
              // Sign in using the verificationID and the code sent to the user
              if let verificationID = verificationID {
                  self.verificationID  = verificationID
                  self.show = true
                  UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                
              }
              
          }
    }
}

#Preview {
    SignInWithPhoneView()
}
