//
//  Car.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import Foundation

struct Car: Equatable, Identifiable {
    
    let id: String
    let name: String
    let info: String
    let imageURL: URL?
    var isFavourite: Bool
    
    static func mock() -> Self {
        Car(id: "car1",
            name: "Dodge Daytona",
            info: "Dodge produced three separate models with the name Dodge Charger Daytona, all of which were modified Dodge Chargers. The name was taken from Daytona Beach, Florida, which was an early center for auto racing and still hosts the Daytona 500, NASCAR's premier event.\n\nThe original Dodge Charger Daytona was designed to beat the competition in NASCAR racing. It was the first NASCAR vehicle to reach 200 miles per hour, which was a major milestone at the time.",
            imageURL: URL(string: "https://i.pinimg.com/originals/bd/6f/35/bd6f35d2f531bcd1481806fb10762a43.jpg"),
            isFavourite: false)
    }
}
