//
//  RandomUserView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import SwiftUI

struct RandomUserView: View {
    @StateObject private var viewModel = RandomUserViewModel()
    
    var body: some View {
        VStack {
            if let user = viewModel.user {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(user.name.first) \(user.name.last)")
                    Text("Gender: \(user.gender)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.location.street.name), \(user.location.street.number), \(user.location.city), \(user.location.state), \(user.location.country)")
                }
                .padding()
            } else {
                ProgressView("Fetching user information...")
            }
            
            Button("Get Random User") {
                viewModel.fetchRandomUser()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
        }
        .onAppear {
            viewModel.fetchRandomUser()
        }
        .padding()
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
