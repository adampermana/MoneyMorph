//
//  DogRandomImageView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 01/08/23.
//

import SwiftUI

struct DogRandomImageView: View {
    @StateObject private var viewModel = DogImageViewModel()

    var body: some View {
        VStack {
            Text("Random Dog Image")
                .padding()
            
            if let imageURL = viewModel.dogImageURL {
                DogImageView(dogImageURL: imageURL)
            } else {
                ProgressView("Klik Get Baru muncul image nya...")
            }

            Button("Get Random Dog Image") {
                viewModel.fetchRandomDogImage()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
        }
        .padding()
    }
}

struct DogRandomImageView_Previews: PreviewProvider {
    static var previews: some View {
        DogRandomImageView()
    }
}
