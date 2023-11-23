//
//  CarFeature.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import ComposableArchitecture

struct CarFeature: Reducer {
    
    struct State: Equatable {
        
        var car: Car = .mock()
    }
    
    enum Action: Equatable {
        
        case favoriteToggle
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .favoriteToggle:
            state.car.isFavourite.toggle()
            return .none
        }
    }
}
