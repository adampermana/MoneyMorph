//
//  CatFactManager.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import Foundation

class CatFactManager: ObservableObject {
    @Published var catFact: CatFact?
    
    func fetchCatFact() {
        let urlString = "https://catfact.ninja/fact"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching cat fact: \(error.localizedDescription)")
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let catFact = try decoder.decode(CatFact.self, from: data)
                    DispatchQueue.main.async {
                        self.catFact = catFact
                    }
                } catch {
                    print("Error decoding cat fact: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
