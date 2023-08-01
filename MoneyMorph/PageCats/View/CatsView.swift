//
//  CatsView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import SwiftUI

struct CatsView: View {
    @StateObject private var catFactManager = CatFactManager()
    
    var body: some View {
        VStack {
            if let catFact = catFactManager.catFact {
                Text(catFact.fact)
                    .font(.title)
                    .padding()
            } else {
                ProgressView("Fetching cat fact...")
            }
            
            Button("Get Random Cat Fact") {
                catFactManager.fetchCatFact()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
        }
        .onAppear {
            catFactManager.fetchCatFact()
        }
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView()
    }
}
