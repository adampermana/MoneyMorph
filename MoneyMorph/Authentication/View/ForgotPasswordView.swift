//
//  ForgotPasswordView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 26/06/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var emailID: String = ""
    @State private var isLoginViewPresented = false
    
    let amberYellow = Color("AmberYellow")
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                VStack(alignment: .center, spacing: 5) {
                    
                    //                    Title MoneyMorph
                    Text("Enter your email to reset password")
                        .font(
                            Font.custom("Poppins-Bold", size: 35))
                        .foregroundColor(amberYellow)
                    
                }
                .padding(10)
                
                //                Import and Config email and password
                VStack(alignment: .leading, spacing: 5) {
                    //                    EMAIL
                    Text("Email Address")
                        .font(.system(size: 14))
                    ComponentsTextField(text: $emailID,
                                        hint: "Enter you Email",
                                        leadingIcon: Image(systemName: "envelope"))
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none) // Nonaktifkan Huruf Kapital
                    .textContentType(.emailAddress) // Aktifkan copy, paste, dan select all untuk alamat email
                    
                }
                
                
                //                Config Button: Forgot password, Login and Switch SignUp
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    
                    Spacer()
                }
                
                //                Button Login
                Button(action: {
                    // Add action for login button here
                }) {
                    Text("Reset Password")
                        .font(
                            Font.custom("Poppins-Bold", size: 20))
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(width: 300)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(amberYellow))
                }
                .padding()
            }
            .padding(10)
            
            //            Button Cancel
            HStack(alignment: .firstTextBaseline, spacing: -6) {
                
                Button(action: {
                    // Tambahkan tindakan yang diinginkan saat tombol Cancel ditekan
                    isLoginViewPresented = true // Mengubah status isLoginViewPresented menjadi true
                    
                }) {
                    Text("Cancel")
                        .font(Font.custom("Poppins-Medium", size: 20))
                        .foregroundColor(amberYellow)
                }
                .padding(10)
            }
            .fullScreenCover(isPresented: $isLoginViewPresented) {
                       LoginView() // Tampilan halaman login yang ingin ditampilkan secara penuh
                   }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            .offset(y: 180)
            .padding(10)
            
        }
       
            
    }
}
    

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
