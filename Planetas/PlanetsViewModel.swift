//
//  PlanetsViewModel.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import Foundation
import Combine

class PlanetsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var planets = [Planet]()
    
    func downloadPlanets() async throws {
        isLoading = true
        do {
            /*
            // Real request
            let url = URL(string: "")!
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            let items = try decoder.decode([Planet].self, from: data)
            */
            
            // Simulate request
            try await Task.sleep(for: .seconds(1))
            
            isLoading = false
            planets = planetList
            
        } catch {
            isLoading = false
            print("PlanetsViewModel Error:", error.localizedDescription)
            throw error
        }
    }
    
}

let planetList = [
    Planet(name: "Mercury", description: "First planet of the solar system."),
    Planet(name: "Venus", description: "Second planet of the solar system."),
    Planet(name: "Earth", description: "Third planet of the solar system."),
    Planet(name: "Mars", description: "Fourth planet of the solar system."),
]
