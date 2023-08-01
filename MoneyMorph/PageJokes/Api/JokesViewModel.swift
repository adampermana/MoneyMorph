//
//  JokesViewModel.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import Foundation

class JokesViewModel: ObservableObject {
    @Published var joke: Joke?
    @Published var isLoading = false

    func fetchRandomJoke() {
        isLoading = true
        let urlString = "https://official-joke-api.appspot.com/random_joke"

        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                defer { self.isLoading = false }

                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let joke = try decoder.decode(Joke.self, from: data)
                        DispatchQueue.main.async {
                            self.joke = joke
                        }
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
    }
}
