//
//  HomeView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 25/06/23.
//



import SwiftUI

struct Item: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let image: String
    let imgColor: Color
    var imageSize: CGFloat = 60 // Change this value as needed
}

struct HomeView: View {
    
    let items = [
        Item(title: "IP Info", image: "ipaddress", imgColor: .orange),
        Item(title: "Cats", image: "cats", imgColor: .blue),
        Item(title: "Jokes", image: "comedy", imgColor: .red),
        Item(title: "Dog", image: "dog", imgColor: .purple),
        Item(title: "Age", image: "age", imgColor: .black),
        Item(title: "User", image: "user", imgColor: .black),
    ]
    
    let spacing: CGFloat = 10
    @State private var numberOfColumns = 3
    @State private var selectedDestination: Item? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                headerView
                
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach(items) { item in
                        NavigationLink(destination: destinationView(for: item), tag: item, selection: $selectedDestination) {
                            ItemView(item: item)
                                .onTapGesture {
                                    selectedDestination = item
                                }
                        }
                        .buttonStyle(ItemButtonStyle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal)
                .offset(y: -50)
            }
            .background(Color.white)
            .ignoresSafeArea()
            .accentColor(.orange)
            .navigationBarTitleDisplayMode(.inline) // Show title inline in navigation bar
            .toolbar {
                // Back button to dismiss the destination view
                ToolbarItem(placement: .navigationBarLeading) {
                    if selectedDestination != nil {
                        Button(action: {
                            selectedDestination = nil
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange) // Set the color to orange
                                .imageScale(.large)
                        }
                    } else {
                        // Empty button as a placeholder to maintain consistent navigation bar layout
                        Button(action: {}) {
                            Image(systemName: "")
                                .opacity(0)
                        }
                    }
                }
            }
        }
    }
    
    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing), count: numberOfColumns)
    }
    
    var headerView: some View {
        // Your header view implementation here (same as before)
        VStack {
            Image("dasha")
                .resizable()
                .frame(width: 110, height: 110)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .onTapGesture {
                    numberOfColumns = numberOfColumns % 3 + 1
                }
            
            // Name Profile
            Text("Dasha Taran")
                .foregroundColor(Color.white)
                .font(.system(size: 30, weight: .medium, design: .rounded))
            
            Text("In man-machine symbiosis, it is man who must adjust: The machines can't.")
                .foregroundColor(Color.white.opacity(0.7))
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
        }
        .frame(height: 350)
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
    }
    
    func destinationView(for item: Item) -> AnyView {
        switch item.title {
        case "IP Info":
            return AnyView(IPInfoView())
        case "Cats":
            return AnyView(CatsView())
        case "Jokes":
            return AnyView(JokeView())
        case "Dog":
            return AnyView(DogRandomImageView()) // Replace DogRandomImageView() with DogView() or any appropriate view for "Dog"
        case "Age":
            return AnyView(AgePredictionView())
        case "User":
            return AnyView(RandomUserView())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct ItemButtonStyle: ButtonStyle {
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
            
            if configuration.isPressed {
                Color.black.opacity(0.2)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}

struct ItemView: View {
    
    let item: Item
    var body: some View {
        
        GeometryReader { reader in
            
            // so that the text and the image always fit the views dimensions
            let fontSize = min(reader.size.width * 0.2, 28)
            let _: CGFloat = min(50, reader.size.width * 0.6)
            VStack(spacing: 5) {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                
                Text(item.title)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
            }
            .background(Color.white)
            .frame(width: reader.size.width, height: reader.size.height)
        }
        .frame(height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
