//
//  ContentView.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    
    var body: some View {
        CarListView(store: Store(initialState: CarListFeature.State(cars: []),
                                 reducer: { CarListFeature() }))
    }
}

#Preview {
    MainView()
}
