//
//  CountryDetailView.swift
//  API1
//
//  Created by 原里駆 on 2025/05/10.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country
    
    var body: some View {
        VStack(spacing:16) {
            AsyncImage(url: URL(string: country.flags.png)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "xmark.octagon")
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 200)
            
            Text("首都: \(country.capital?.first ?? "N/A")")
            Text("エリア: \(country.region)")
        }
        .padding()
        .navigationTitle(country.name.common)
    }
}


