//
//  CarView.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import SwiftUI
import ComposableArchitecture

struct CarView: View {
    
    let store: StoreOf<CarFeature>
    @ObservedObject var viewStore: ViewStoreOf<CarFeature>
    
    init(store: StoreOf<CarFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: { $0 })
    }
    
    var body: some View {
        content
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
        AsyncImage(url: viewStore.car.imageURL) { image in
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
        .frame(height: UIScreen.main.bounds.height / 3)
    }
    
    var control: some View {
        HStack(spacing: 20) {
            Text(viewStore.car.name)
                .font(.title)
                .bold()
            Spacer()
            Image(systemName: "text.bubble")
                .resizable()
                .frame(width: 24, height: 20)
            Image(systemName: viewStore.car.isFavourite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 24, height: 20)
                .foregroundStyle(viewStore.car.isFavourite ? .pink : .gray)
                .onTapGesture {
                    viewStore.send(.favoriteToggle)
                }
        }
        .padding(.horizontal)
    }
    
    var info: some View {
        Text(viewStore.car.info)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
    }
}

#Preview {
    CarView(store: Store(initialState: CarFeature.State(car: .mock()),
                         reducer: { CarFeature() }))
}
