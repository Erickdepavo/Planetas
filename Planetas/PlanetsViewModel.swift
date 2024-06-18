//
//  PlanetsViewModel.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import Foundation
import Combine

@Observable
class PlanetsViewModel {
    var planets: Result<[Planet], Error>? = .success(planetList)
    var selectedPlanet: Planet? = nil
    
    func downloadPlanets() async {
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
            self.planets = .success(planetList)
            
        } catch {
            self.planets = .failure(error)
        }
    }
}
