//
//  LoginView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 21/06/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var isForgotPasswordViewPresented = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    let amberYellow = Color("AmberYellow")
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                VStack(alignment: .center, spacing: 5) {
//                    ImageMoneyMorph
                    Image("MoneyMorphPNG")
                        .padding(10)
                    
//                    Title MoneyMorph
                    Text("Sign in to Money Morph")
                        .font(
                        Font.custom("Poppins-Bold", size: 29))
                        .foregroundColor(amberYellow)
                        
                }
                .padding(10)
                
//                Import and Config email and password
                VStack(alignment: .leading, spacing: 5) {
//                    EMAIL
                    Text("Email Address")
                        .font(
                        Font.custom("Poppins-Reguler", size: 14))
                        .offset(y: 8)
                    ComponentsTextField(text: $emailID,
                                        hint: "Enter you Email",
                                        leadingIcon: Image(systemName: "envelope"))
                    .keyboardType(.emailAddress)
                        .autocapitalization(.none) // Nonaktifkan Huruf Kapital
                        .textContentType(.emailAddress) // Aktifkan copy, paste, dan select all untuk alamat email
                        .autocorrectionDisabled()
                        .submitLabel(.next)
                }
                
                VStack(alignment: .leading, spacing: 5) {
//                    PASSWORD
                    Text("Password")
                        .font(
                        Font.custom("Poppins-Reguler", size: 14))
                        .offset(y: 8)
                    
                    ComponentsTextField(text: $password,
                                        hint: "Enter you Password",
                                        leadingIcon: Image(systemName: "lock"),
                                        isPassword: true)
                        .autocapitalization(.none) // Nonaktifkan Huruf Kapital
                        .textContentType(.password) // Aktifkan copy, paste, dan select all untuk alamat email
                        .submitLabel(.next)
                }
                
//                Config Button: Forgot password, Login and Switch SignUp
                HStack(alignment: .lastTextBaseline, spacing: 3) {
                    Spacer()
//                    Forgot password
                    Button(action: {
                        // Add action for the "Forgot Password?" button here
                        isForgotPasswordViewPresented = true // Mengubah status
                    }) {
                        Text("Forgot Password?")
                            .font(
                            Font.custom("Poppins-Reguler", size: 17))
                            .foregroundColor(amberYellow)
                            .offset(x: -24)
                    }
                    
                }
                
                .fullScreenCover(isPresented: $isForgotPasswordViewPresented) {
                    ForgotPasswordView() // Tampilan halaman login yang ingin ditampilkan secara
                }
                
//                Button Login
                Button(action: {
                    login()
                    
                }) {
                    Text("Log in")
                 
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(width: 300)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(amberYellow))
                    .font(
                    Font.custom("Poppins-Bold", size: 28))
                }
                .padding()
            }
            
            .padding(10)
            
//            Switch Sign Up
            VStack {
                Spacer()
                SwitchSignUpView()
                    .offset(y: -60)
            }
            
            .padding(-6)
        }
        .padding(-10)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: emailID, password: password) { result,
            error in
            if let error = error { // login error occurred
                print("Login Error cuy: \(error.localizedDescription)")
                alertMessage = "Login Error Manizz: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("Done Login Maniszz")
//                TODO: Load List View
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
