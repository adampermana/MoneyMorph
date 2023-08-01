//
//  IPInfoViewModel.swift
//  MoneyMorph
//
//  Created by Adam Permana on 01/08/23.
//

import Foundation

class IPInfoViewModel: ObservableObject {
    @Published var ipInfo: IPInfo?
    @Published var isLoading = false

    func fetchIPInfo(for ipAddress: String) {
        isLoading = true
        
        let urlString = "https://ipinfo.io/\(ipAddress)/geo"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            isLoading = false
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let ipInfo = try decoder.decode(IPInfo.self, from: data)
                    DispatchQueue.main.async {
                        self.ipInfo = ipInfo
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
