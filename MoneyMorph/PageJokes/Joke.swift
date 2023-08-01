//
//  Joke.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import Foundation

struct Joke: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
