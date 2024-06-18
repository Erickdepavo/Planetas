//
//  Planet.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import Foundation

@Observable
class Planet {
    let name: String
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}

extension Planet: Identifiable, Hashable {
    var id: String { name }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(description)
    }
    
    static func == (lhs: Planet, rhs: Planet) -> Bool {
        lhs.name == rhs.name && lhs.description == rhs.description
    }
}
