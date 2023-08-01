//
//  University.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

// University.swift

import Foundation

struct University: Codable, Identifiable {
    let id: UUID = UUID()
    let country: String
    let domains: [String]
    let alphaTwoCode: String
    let stateProvince: String?
    let webPages: [String]
    let name: String

    enum CodingKeys: String, CodingKey {
        case country, domains
        case alphaTwoCode = "alpha_two_code"
        case stateProvince = "state-province"
        case webPages = "web_pages"
        case name
    }
}
