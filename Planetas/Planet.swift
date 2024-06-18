//
//  Planet.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import Foundation

struct Planet {
    let name: String
    let description: String
}

extension Planet: Identifiable, Hashable {
    var id: String { name }
}
