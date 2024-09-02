//
//  CarListFeature.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 23.11.2023.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct CarListFeature {
    
    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
        
        var cars: [Car] = []
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case path(StackAction<Path.State, Path.Action>)
        
        case onAppear
        case onCarCellTap(model: Car)
    }
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.cars = [.mock(), .mock1()]
                return .none
                
            case let .onCarCellTap(model: model):
                state.path.append(.pushCarDetailed(CarFeature.State(car: model)))
                return .none
                
            case let .path(action):
                return CarListPathReducer.reduce(state: &state, action: action)
                
                //MARK: - Other
            case .binding:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

extension CarListFeature {
    
    @Reducer(state: .equatable)
    enum Path {
        case pushCarDetailed(CarFeature)
    }
}
