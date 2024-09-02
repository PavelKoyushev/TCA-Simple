//
//  CarListCell.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 23.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CarListCell: View {
    
    let model: Car
    let action: (Car) -> Void
    
    var body: some View {
        content
            .onTapGesture(perform: onCellTap)
    }
}

private extension CarListCell {
    
    var content: some View {
        VStack(spacing: 0) {
            image
            text
        }
        .background(Color.gray.opacity(0.3))
        .padding(.horizontal)
        .contentShape(Rectangle())
    }
    
    var image: some View {
        WebImage(url: model.imageURL) { image in
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
        .indicator(.activity)
        .transition(.fade(duration: 0.5))
        .scaledToFill()
        .frame(width: UIScreen.main.bounds.width - 32,
               height: (UIScreen.main.bounds.width - 32) / 1.8)
        .clipped()
    }
    
    var text: some View {
        Text(model.name)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 40)
            .padding(.leading)
    }
}

private extension CarListCell {
    
    func onCellTap() {
        action(model)
    }
}

#Preview {
    CarListCell(model: .mock(),
                action: { _ in })
}
