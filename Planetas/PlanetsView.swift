//
//  PlanetsView.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import SwiftUI

struct PlanetsView: View {
    
    @StateObject private var model = PlanetsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if model.isLoading && model.planets.isEmpty {
                    ProgressView()
                        .padding(32)
                        .controlSize(.large)
                } else {
                    ForEach(model.planets) { planet in
                        NavigationLink(value: planet) {
                            HStack(spacing: 32) {
                                Image(planet.name)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(height: 120)
                                Text(planet.name)
                                    .font(.title.bold())
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .background(Material.regular, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Planetas")
        .navigationDestination(for: Planet.self) { planet in
            PlanetView(planet: planet, model: model)
        }
        .onAppear(perform: downloadPlanets)
    }
    
    func downloadPlanets() {
        Task {
            do {
                try await model.downloadPlanets()
            } catch {
                
            }
        }
    }
}

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitView {
            PlanetsView()
        } detail: {
            Text("Planetas")
        }
    }
}
