//
//  CarListPathReducer.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 02.09.2024.
//

import ComposableArchitecture
import Foundation

struct CarListPathReducer {
    
    static func reduce(
        state: inout CarListFeature.State,
        action: (StackAction<CarListFeature.Path.State, CarListFeature.Path.Action>)) -> Effect<CarListFeature.Action> {
            switch action {
            case .element(id: let id, action: let action):
                return .none
            case .popFrom(id: let id):
                return .none
            case .push(id: let id, state: let state):
                return .none
            }
        }
}
