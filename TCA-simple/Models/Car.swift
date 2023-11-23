//
//  Car.swift
//  TCA-simple
//
//  Created by Pavel Koyushev on 13.11.2023.
//

import Foundation

struct Car: Equatable, Identifiable, Hashable {
    
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
    
    static func mock1() -> Self {
        Car(id: "car2",
            name: "Ford Mustang",
            info: "The first-generation Ford Mustang was manufactured by Ford from March 1964 until 1973. The introduction of the Mustang created a new class of automobiles known as the pony cars. The Mustang's styling, with its long hood and short deck, proved wildly popular and inspired a host of competition.\nIt was initially introduced on April 17, 1964, as a hardtop and convertible with the fastback version put on sale in August 1964. At the time of its introduction, the Mustang, sharing its platform with the Falcon, was slotted into a compact car segment.",
            imageURL: URL(string: "https://i.pinimg.com/originals/43/04/40/4304406bf710b3b77622c63c117ff395.jpg"),
            isFavourite: false)
    }
}
