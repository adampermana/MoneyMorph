//
//  UniversitiyView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 31/07/23.
//

import SwiftUI

struct UniversityView: View {
    @StateObject private var universitiesViewModel = UniversitiesViewModel()
    @State private var selectedCountry = "Indonesia"
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Country", selection: $selectedCountry) {
                    Text("Indonesia").tag("Indonesia")
                    Text("United States").tag("United States")
                    // Add more countries here if needed
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Button("Fetch Universities") {
                    universitiesViewModel.fetchUniversities(for: selectedCountry)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                
                if universitiesViewModel.isLoading {
                    ProgressView("Fetching universities...")
                } else {
                    List(universitiesViewModel.universities) { university in
                        VStack(alignment: .leading) {
                            Text(university.name)
                                .font(.headline)
                            Text(university.stateProvince ?? "")
                                .font(.subheadline) // Show region, if available
                            Text(university.country)
                                .font(.subheadline)
                            ForEach(university.webPages, id: \.self) { webPage in
                                Link(webPage, destination: URL(string: webPage)!)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        .border(Color.gray, width: 1)
                        .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Universities List")
        }
        .onAppear {
            universitiesViewModel.fetchUniversities(for: selectedCountry)
        }
    }
}

struct UniversityView_Previews: PreviewProvider {
    static var previews: some View {
        UniversityView()
    }
}
