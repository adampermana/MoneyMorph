//
//  IPinfoView.swift
//  MoneyMorph
//
//  Created by Adam Permana on 01/08/23.
//

import SwiftUI

struct IPInfoView: View {
    @StateObject private var viewModel = IPInfoViewModel()
    @State private var ipAddress = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                TextField("Enter IP Address", text: $ipAddress, onCommit: {
                    viewModel.fetchIPInfo(for: ipAddress)

                })
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.5), lineWidth: 1)
                )
                .foregroundColor(.black)
                
                Button(action: {
                    viewModel.fetchIPInfo(for: ipAddress)
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.yellow)
                        .padding(.trailing, 8)
                }
                .padding(.top, 8)
            }
            .keyboardType(.numberPad)

            if let ipInfo = viewModel.ipInfo {
                List {
                    Text("IP Address: \(ipInfo.ip)")
                    Text("City: \(ipInfo.city ?? "N/A")")
                    Text("Region: \(ipInfo.region ?? "N/A")")
                    Text("Country: \(ipInfo.country ?? "N/A")")
                    Text("Organization: \(ipInfo.org ?? "N/A")")
                    Text("Carrier: \(ipInfo.carrier ?? "N/A")")
                }
            } else {
                Text("Enter an IP address to get information.")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onAppear {
            // Fetch initial IP info for demonstration purposes (you can remove this if needed)
            viewModel.fetchIPInfo(for: "161.185.160.93")
        }
    }
}

struct IPInfoView_Previews: PreviewProvider {
    static var previews: some View {
        IPInfoView()
    }
}
