//
//  ComponentsTextFieldloginView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 27/06/23.
//

import SwiftUI

struct ComponentsTextFieldlogin: View {
    @Binding var text: String
    var hint: String
    var leadingIcon: Image
    var isPassword: Bool = false
    
    @State private var isSecureTextEntry: Bool = true
    
    var body: some View {
        HStack(spacing: -10) {
            leadingIcon
                .font(.callout)
                .foregroundColor(.gray)
                .frame(width: 40, alignment: .leading)
            
            if isPassword {
                if isSecureTextEntry {
                    SecureField(hint, text: $text)
                        .frame(width: 270, height: 30)
                } else {
                    TextField(hint, text: $text)
                        .frame(width: 270, height: 30)
                }
                
                Button(action: {
                    isSecureTextEntry.toggle()
                }) {
                    Image(systemName: isSecureTextEntry ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
                .buttonStyle(PlainButtonStyle())
                
            } else {
                TextField(hint, text: $text)
                    .frame(width: 290, height: 30)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .border(Color.black, width: 2)
    }
}


