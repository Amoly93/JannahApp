//
//  OTPVerificationView.swift
//  JannahApp
//
//  Created by amal badr on 31/01/2024.
//

import SwiftUI
import FirebaseAuth
import Firebase
struct OTPVerificationView: View {
    @State private var OTP = ""
   @Binding  var phone:String
    @State private var show = false
    var body: some View {
        VStack(spacing: 24.0){
            Text("ادخل رمز التاكيد")
                .font(.custom("Tajawal-Bold", size: 18))
                .foregroundStyle(.colorPrimer)
            HStack{
                TextField("", text: $OTP)
                    .keyboardType(.numberPad)
      
              
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 14.0/*@END_MENU_TOKEN@*/)
            
            .background(Color.colorGray)
            
            Button {
                self.verifyOTP()
         
            } label: {
                Label("تأكيد", systemImage: "")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .font(.custom("Tajawal-Medium", size: 18))
                    .foregroundStyle(.white)
                    .background(.colorYellow)
            }
            .navigationDestination(isPresented:$show) {
         ContentView()
            }
        }
        .padding(.horizontal, 16.0)
    }
    private func verifyOTP(){
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")

        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID ?? "",
          verificationCode: OTP
        )
        Auth.auth().signIn(with: credential){user , error in
            if let  error = error{
                print(error.localizedDescription)
                return
            }else{
                      
                        let db = Firestore.firestore()
                
                db.collection("User").document(Auth.auth().currentUser?.uid ?? "").setData(["phoneNum":"\(phone)"], merge: true) { error in
           
                            if error == nil {
                       
                            }
                        }
                self.show = true
        print("Success")
            }
        }
    }
}

//#Preview {
//    OTPVerificationView()
//}
