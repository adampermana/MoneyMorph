//
//  ViewJokes.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import SwiftUI

struct JokeView: View {
    @StateObject private var jokesViewModel = JokesViewModel()

    var body: some View {
        VStack {
            if jokesViewModel.isLoading {
                ProgressView("Fetching joke...")
            } else {
                if let joke = jokesViewModel.joke {
                    Text(joke.type)
                        .font(.title)
                        .foregroundColor(.yellow)
                        .padding()

                    Text(joke.setup)
                        .font(.headline)
                        .padding()

                    Text(joke.punchline)
                        .font(.subheadline)
                        .italic()
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    Text("No joke available.")
                        .foregroundColor(.red)
                        .padding()
                }
            }

            Button("Get Random Joke") {
                jokesViewModel.fetchRandomJoke()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
        }
        .padding()
        .onAppear {
            jokesViewModel.fetchRandomJoke()
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
