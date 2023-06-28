//
//  LegalDocumentView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 26/06/23.
//

import SwiftUI

struct LegalDocumentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("By continuing, you agree to Money Morph")
            
            HStack(spacing: 1) {
                Text("Terms of use")
                    .underline()
                
                Text(". Read our ")
                
                Text("Privacy Policy")
                    .underline()
            }
        }
    }
}

struct LegalDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        LegalDocumentView()
    }
}
