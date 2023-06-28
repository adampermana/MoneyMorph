//
//  LoginView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 21/06/23.
//

import SwiftUI

struct LoginView: View {
    @State private var emailID: String = ""
    @State private var passwordID: String = ""
    
    let amberYellow = Color("AmberYellow")
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email Address")
                        .font(.system(size: 14))
                    ComponentsTextFieldlogin(text: $emailID,
                                              hint: "Enter your email",
                                              leadingIcon: Image(systemName: "envelope"))
                        .autocapitalization(.none)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.system(size: 14))
                    ComponentsTextFieldlogin(text: $passwordID,
                                              hint: "Enter password",
                                              leadingIcon: Image(systemName: "lock"),
                                              isPassword: true)
                        .autocapitalization(.none)
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Button(action: {
                        // Add action for the "Forgot Password?" button here
                    }) {
                        Text("Forgot Password?")
                            .font(.system(size: 17))
                            .foregroundColor(amberYellow)
                            .offset(x: 220)
                    }
                    Spacer()
                }
                
                Button(action: {
                    // Add action for login button here
                }) {
                    Text("LOGIN")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(width: 220)
                        .background(
                            Capsule()
                                .fill(amberYellow)
                        )
                }
                .padding()
            }
            .padding(10)
            
            VStack {
                Spacer()
                SwitchSignUpView()
                    .offset(y: -230)
            }
            .padding(10)
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
