//
//  CarListView.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 23.11.2023.
//

import SwiftUI
import ComposableArchitecture

struct CarListView: View {
    
    @Perception.Bindable var store: StoreOf<CarListFeature>
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                content
                    .onAppear(perform: onAppear)
                    .toolbar(.visible)
                    .navigationTitle(Text("CarList"))
                    .navigationBarTitleDisplayMode(.inline)
            } destination: { store in
                WithPerceptionTracking {
                    destination(with: store)
                }
            }
        }
    }
}

private extension CarListView {
    
    var content: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(store.cars) { car in
                    CarListCell(model: car,
                                action: onCarListCellTap)
                }
            }
        }
    }
}

private extension CarListView {
    
    @ViewBuilder
    func destination(with store: Store<CarListFeature.Path.State, CarListFeature.Path.Action>) -> some View {
        switch store.case {
        case let .pushCarDetailed(store):
            CarView(store: store)
        }
    }
}

//MARK: - Actions
private extension CarListView {
    
    func onAppear() {
        store.send(.onAppear)
    }
    
    func onCarListCellTap(model: Car) {
        store.send(.onCarCellTap(model: model))
    }
}

#Preview {
    CarListView(store: Store(initialState: CarListFeature.State(cars: []),
                             reducer: { CarListFeature() }))
}
