//
//  AgePredictionView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 01/08/23.
//

import SwiftUI

struct AgePredictionView: View {
    @State private var name = ""
    @State private var agePrediction: String = ""
    
    var body: some View {
        VStack {
            Text("Age Prediction")
            TextField("Enter a name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Predict Age") {
                fetchAgePrediction()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
            
            if !agePrediction.isEmpty {
                Text("Predicted Age: \(agePrediction)")
                    .padding()
            }
        }
        .padding()
    }
    
    private func fetchAgePrediction() {
        guard let url = URL(string: "https://api.agify.io?name=\(name)") else {
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
                    let agePredictionData = try decoder.decode(AgePredictionData.self, from: data)
                    DispatchQueue.main.async {
                        agePrediction = "\(agePredictionData.age)"
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}

struct AgePredictionView_Previews: PreviewProvider {
    static var previews: some View {
        AgePredictionView()
    }
}
