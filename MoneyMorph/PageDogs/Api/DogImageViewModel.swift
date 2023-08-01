//
//  MoneyMorph
//
//DogImageViewModel
//  Created by Adam Permana on 31/07/23.
//


import Foundation

class DogImageViewModel: ObservableObject {
    @Published var dogImageURL: URL?
    @Published var isLoading = false

    func fetchRandomDogImage() {
        isLoading = true
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            print("Invalid URL")
            isLoading = false
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(DogImageResponse.self, from: data)
                        if let imageURL = URL(string: response.message) {
                            self.dogImageURL = imageURL
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
}
