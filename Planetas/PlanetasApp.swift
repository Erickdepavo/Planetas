//
//  PlanetasApp.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import SwiftUI

@main
struct PlanetasApp: App {
    var body: some Scene {
        WindowGroup {
            AlertController {
                NavigationSplitView {
                    PlanetsView()
                } detail: {
                    Text("Planetas")
                }
            }
        }
    }
}
