//
//  ComponentsTextFieldloginView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 27/06/23.
//

import SwiftUI

struct ComponentsTextField: View {
    @Binding var text: String
    let title = ""
    var hint: String
    var leadingIcon: Image
    var isPassword: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 14))
                
            HStack(spacing: -10) {
                leadingIcon
                    .font(.callout)
                    .foregroundColor(.gray)
                    .frame(width: 50, alignment: .leading)
                            
                if isPassword {
                    SecureField(hint, text: $text)
                        .frame(width: 270, height: 30)
                } else {
                    TextField(hint, text: $text)
                        .frame(width: 270, height: 30)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .border(Color.black, width: 2)
        }
    }
}
