//
//  SwitchSignUpView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 26/06/23.
//

import SwiftUI

let amberYellow = Color("AmberYellow")

struct SwitchSignUpView: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 3) {
            
            Text("Don't have an account?")
                .font(.system(size: 14))
            
            Button {
            }
        label: {
            Text("Sign up now")
                .font(.system(size: 17))
                .foregroundColor(amberYellow)
            }
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
