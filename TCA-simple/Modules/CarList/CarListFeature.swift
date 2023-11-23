//
//  CarListFeature.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 23.11.2023.
//

import SwiftUI
import ComposableArchitecture

struct CarListFeature: Reducer {
    
    struct State: Equatable {
        
        var cars: [Car] = []
        var destinations: [Destination] = []
        
        enum Destination: Hashable {
            case carDetail(model: Car)
        }
    }
    
    enum Action: Equatable {
        
        case onAppear
        case pushCarDetailed(model: Car)
        case navigationPathChanged([State.Destination])
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .onAppear:
            state.cars = [.mock(), .mock1()]
            return .none
        case let .pushCarDetailed(model):
            state.destinations.append(.carDetail(model: model))
            return .none
        case let .navigationPathChanged(destinations):
            state.destinations = destinations
            return .none
        }
    }
}
