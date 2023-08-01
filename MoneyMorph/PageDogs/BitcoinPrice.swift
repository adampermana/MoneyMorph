//
//  BitcoinPrice.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import Foundation

struct BitcoinPrice: Codable {
    let time: Time
    let bpi: BPI
}

struct Time: Codable {
    let updated: String
}

struct BPI: Codable {
    let usd: Currency
}

struct Currency: Codable {
    let rate: String
    let description: [String: String]
}

class BitcoinPriceViewModel: ObservableObject {
    @Published var bitcoinPrice: BitcoinPrice?
    @Published var isLoading = false

    var sortedCurrencies: [(key: String, value: String)] {
        return bitcoinPrice?.bpi.usd.description.sorted(by: { $0.key < $1.key }) ?? []
    }

    func fetchBitcoinPrice() {
        isLoading = true
        
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
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
                    let bitcoinPrice = try decoder.decode(BitcoinPrice.self, from: data)
                    DispatchQueue.main.async {
                        self.bitcoinPrice = bitcoinPrice
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
