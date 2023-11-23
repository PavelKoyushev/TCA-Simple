//
//  CarListView.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 23.11.2023.
//

import SwiftUI
import ComposableArchitecture

struct CarListView: View {
    
    let store: StoreOf<CarListFeature>
    @ObservedObject var viewStore: ViewStoreOf<CarListFeature>
    
    init(store: StoreOf<CarListFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: { $0 })
    }
    
    var body: some View {
        content
            .onAppear {
                viewStore.send(.onAppear)
            }
    }
}

private extension CarListView {
    
    var content: some View {
        NavigationStack(path: viewStore.binding(
            get: \.destinations,
            send: CarListFeature.Action.navigationPathChanged
        ), root: scrollView)}
    
    func scrollView() -> some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewStore.cars) { car in
                    CarListCell(model: car)
                        .onTapGesture {
                            viewStore.send(.pushCarDetailed(model: car))
                        }
                }
            }
        }
        .navigationDestination(for: CarListFeature.State.Destination.self) { destination in
            switch destination {
            case let .carDetail(model):
                CarView(store: Store(initialState: CarFeature.State(car: model),
                                     reducer: { CarFeature() }))
            }
        }
    }
}

#Preview {
    CarListView(store: Store(initialState: CarListFeature.State(cars: []),
                             reducer: { CarListFeature() }))
}
