//
//  AuthManager.swift
//  MoneyMorph
//
//  Created by Adam Permana on 29/07/23.
//

import Foundation
import FirebaseAuth

class AuthManager: ObservableObject {
    @Published var isLoggedIn = false

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Login Error: \(error.localizedDescription)")
            } else {
                print("Login Successful")
                self.isLoggedIn = true
            }
        }
    }
}

