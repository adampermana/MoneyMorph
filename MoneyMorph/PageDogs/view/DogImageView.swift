//
//  BitcoinView.swift
//  MoneyMorph
//  DogImageView
//  Created by Adam Permana on 31/07/23.
//



import SwiftUI

struct DogImageView: View {
    let dogImageURL: URL
    
    var body: some View {
        AsyncImage(url: dogImageURL) { phase in
            switch phase {
            case .empty:
                ProgressView("Loading...")
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                    .shadow(radius: 5)
            case .failure:
                Text("Failed to load image")
                    .foregroundColor(.red)
                    .padding()
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct DogImageView_Previews: PreviewProvider {
    static var previews: some View {
        DogImageView(dogImageURL: URL(string: "https://images.dog.ceo/breeds/bulldog/n02096585_10047.jpg")!)
    }
}
