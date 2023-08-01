//
//  RandomUserView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 01/08/23.
//

import Foundation

struct UserInfo: Codable {
    let name: Name
    let gender: String
    let email: String
    let location: Location
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
}

struct Street: Codable {
    let name: String
    let number: Int
}

class RandomUserViewModel: ObservableObject {
    @Published var user: UserInfo?
    
    func fetchRandomUser() {
        guard let url = URL(string: "https://randomuser.me/api/") else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(RandomUserResult.self, from: data)
                    DispatchQueue.main.async {
                        self.user = result.results.first
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}

struct RandomUserResult: Codable {
    let results: [UserInfo]
}
