//
//  CarListCell.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 23.11.2023.
//

import SwiftUI

struct CarListCell: View {
    
    let model: Car
    
    var body: some View {
        VStack(spacing: 0) {
            image
            text
        }
    }
}

private extension CarListCell {
    
    var image: some View {
        AsyncImage(url: model.imageURL) { image in
            image
                .resizable()
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.2)
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 2.1)
            }
        }
        .scaledToFill()
        .frame(width: UIScreen.main.bounds.width - 32)
        .frame(height: UIScreen.main.bounds.height / 3)
        .clipped()
    }
    
    var text: some View {
        Text(model.name)
            .font(.title2)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .frame(height: 40)
            .padding(.leading)
            .background(Color.gray.opacity(0.3))
            .padding(.horizontal)
    }
}

#Preview {
    CarListCell(model: .mock())
}
