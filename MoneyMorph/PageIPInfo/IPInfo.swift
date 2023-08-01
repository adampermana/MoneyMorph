//
//  IPInfo.swift
//  MoneyMorph
//
//  Created by Adam Permana on 01/08/23.
//

import Foundation

struct IPInfo: Codable {
    let ip: String
    let city: String?
    let region: String?
    let country: String?
    let org: String?
    let carrier: String?
}
