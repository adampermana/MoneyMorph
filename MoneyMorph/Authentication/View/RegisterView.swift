//
//  RegisterView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 21/06/23.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var isLoginViewPresented = false
    @State private var showingAlert = false
    @State private var alertMessage = ""
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special char
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    let amberYellow = Color("AmberYellow")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    VStack(alignment: .center, spacing: 5) {
                        //                    ImageMoneyMorph
                        Image("MoneyMorphPNG")
                            .padding(10)
                            .offset(y: 20)
                        
                        //                    Title MoneyMorph
                        Text("Sign up to Money Morph")
                            .font(
                                Font.custom("Poppins-Bold", size: 28))
                            .foregroundColor(amberYellow)
                        
                    }
                    .padding(10)
                    
                    //                TextField
                    VStack(alignment: .leading, spacing: 5) {
                        //                    TectField Email
                        Text("Email Address")
                            .font(.system(size: 14))
                            .offset(y: 8)
                        ComponentsTextField(text: $emailID,
                                            hint: "Enter your email",
                                            leadingIcon: Image(systemName: "envelope"))
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .submitLabel(.next)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password")
                            .font(.system(size: 14))
                            .offset(y: 8)
                        ComponentsTextField(text: $password,
                                            hint: "Enter password",
                                            leadingIcon: Image(systemName: "lock"),
                                            isPassword: true)
                        .overlay(
                             Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                 .resizable()
                                 .frame(width: 20, height: 20)
                                 .foregroundColor(isValidPassword(password) ? .green : .red)
                                 .padding(.trailing, 10)
                                 .opacity(password.isEmpty ? 0 : 1)
                                 .offset(y: 9)
                                 .animation(.default)
                                 .transition(.opacity),
                             alignment: .trailing
                         )
                        .submitLabel(.next)
                        
                       
                    }
                    .padding(14)
                    //                Button Create Account
                    Button(action: {
                        // Add action for login button here
                        register()
                        
                    }) {
                        Text("Create account")
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .frame(width: 300)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(amberYellow))
                            .font(
                                Font.custom("Poppins-Bold", size: 25))
                    }
                    Spacer()
                       
                }
                .padding(4)
                
                
                HStack(alignment: .firstTextBaseline, spacing: -6) {
                    
                    Text("Already have an account?")
                        .font(
                            Font.custom("Poppins-Medium", size: 14))
                    
                    Button(action: {
                        isLoginViewPresented = true // Mengubah status isLoginViewPresented menjadi true
                    }) {
                        Text("Sign in")
                            .font(Font.custom("Poppins-Medium", size: 19))
                            .foregroundColor(amberYellow)
                        
                    }
                    .padding(10)
                    
                }
                .offset(y: 280)
                Spacer()
                .fullScreenCover(isPresented: $isLoginViewPresented) {
                    LoginView() // Tampilan halaman login yang ingin ditampilkan secara penuh
                        
                }
                HStack{
                    LegalDocumentView()
                        
                }
                .padding()
                .offset(y:340)
            }
            
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
            
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
    func register() {
        Auth.auth().createUser(withEmail: emailID, password: password) { result,
            error in
            if let error = error { // login error occurred
                print("Create Error cuy: \(error.localizedDescription)")
                alertMessage = "Create Error Manizz: \(error.localizedDescription)"
                showingAlert = true
            } else {
                print("Done Regis Maniszz")
//                TODO: Load List View
            }
            
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
