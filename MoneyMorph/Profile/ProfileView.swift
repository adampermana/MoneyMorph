//
//  ProfileView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 29/07/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
//        List
        List {
            
//            Section
            Section {
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Adam Permana")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(User.MOCK_USER.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    } // VStack Text name and email
                } // HStack Initial Profile
                
            } // Section
            
            // Section General
            Section("General") {
                HStack {
                    SettingRowView(imageName: "gear",
                                   title: "version",
                                   tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                } // HStack General
            } // Section General
            
            // Section Account
            Section("Account") {
                Button {
                    print("Sign out..")
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Sign out",
                                   tintColor: .red)
                } // label Sign Out
                
                Button {
                    print("Delete Account..")
                } label: {
                    SettingRowView(imageName: "xmark.circle.fill",
                                   title: "Delete Account",
                                   tintColor: .red)
                } // label Delete Account
            } // Section Account
        } // List
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
