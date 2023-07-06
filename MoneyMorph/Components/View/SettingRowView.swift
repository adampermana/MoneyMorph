//
//  SettingRowView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 05/07/23.
//

import SwiftUI

struct SettingRowView: View {
        let imageName: String
        let title: String
        let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
        } // HStack Image and Text
    } // Var Body
} // Struct SettingRowview

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
    }
}
