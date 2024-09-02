//
//  CarView.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import SwiftUI
import ComposableArchitecture
import SDWebImageSwiftUI

struct CarView: View {
    
    @Perception.Bindable var store: StoreOf<CarFeature>
    
    var body: some View {
        WithPerceptionTracking {
            content
        }
    }
}

private extension CarView {
    
    var content: some View {
        ScrollView {
            VStack(spacing: 16) {
                image
                control
                info
            }
        }
    }
    
    var image: some View {
        WebImage(url: store.car.imageURL) { image in
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
        .scaledToFit()
    }
    
    var control: some View {
        HStack(spacing: 20) {
            Text(store.car.name)
                .font(.title)
                .bold()
            Spacer()
            Image(systemName: "text.bubble")
                .resizable()
                .frame(width: 24, height: 20)
            Image(systemName: store.car.isFavourite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 24, height: 20)
                .foregroundStyle(store.car.isFavourite ? .pink : .gray)
                .onTapGesture(perform: onFavoriteTap)
        }
        .padding(.horizontal)
    }
    
    var info: some View {
        Text(store.car.info)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
    }
}

//MARK: - Actions
private extension CarView {
    
    func onFavoriteTap() {
        store.send(.favoriteToggle)
    }
}

#Preview {
    CarView(store: Store(initialState: CarFeature.State(car: .mock()),
                         reducer: { CarFeature() }))
}
