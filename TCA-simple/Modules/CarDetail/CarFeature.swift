//
//  CarFeature.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import ComposableArchitecture

@Reducer
struct CarFeature {
    
    @ObservableState
    struct State: Equatable {
        
        var car: Car = .mock()
    }
    
    enum Action {
        
        case favoriteToggle
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .favoriteToggle:
                state.car.isFavourite.toggle()
                return .none
            }
        }
    }
}
