//
//  User.swift
//  MoneyMorph
//
//  Created by Adam Permana on 05/07/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        } // Fullname
        return ""
    }
} // Struct User

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Adam Permana", email: "test@gmail.com")
}
