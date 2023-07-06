//
//  SwitchSignUpView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 26/06/23.
//

import SwiftUI



struct SwitchSignUpView: View {
    let amberYellow = Color("AmberYellow")
    @State private var isRegisterViewPresented = false
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 3) {
            
            Text("Don't have an account?")
                .font(
                    Font.custom("Poppins-Medium", size: 14))
            
            Button(action: {
                // Add action for the "Sign up" button here
                isRegisterViewPresented = true
            }) {
                Text("Sign up")
                    .font(Font.custom("Poppins-Medium", size: 19))
                    .foregroundColor(amberYellow)
                
            }
        }
        .fullScreenCover(isPresented: $isRegisterViewPresented) {
            RegisterView() // Tampilan halaman Register yang ingin ditampilkan secara penuh
        }
    }
}

struct SwitchSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchSignUpView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
