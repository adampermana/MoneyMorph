//
//  UniversitiesViewModel.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import Foundation

class UniversitiesViewModel: ObservableObject {
    @Published var universities: [University] = []
    @Published var isLoading = false
    
    func fetchUniversities(for country: String) {
        isLoading = true
        
        let urlString = "http://universities.hipolabs.com/search?country=\(country)"
        
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
                        decoder.keyDecodingStrategy = .convertFromSnakeCase // Convert snake_case keys to camelCase
                        let universities = try decoder.decode([University].self, from: data)
                        DispatchQueue.main.async {
                            self.universities = universities
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
