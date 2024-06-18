//
//  PlanetsView.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import SwiftUI

struct PlanetsView: View {
    @State private var model = PlanetsViewModel()
    @ScaledMetric private var planetSize = 48
    
    var body: some View {
        NavigationSplitView {
            Group {
                switch model.planets {
                case nil:
                    ProgressView("Obteniendo...")
                        .frame(maxWidth: .infinity)
                    
                case .success(let planets):
                    List(planets, selection: $model.selectedPlanet) { planet in
                        NavigationLink(value: planet) {
                            HStack(spacing: 12) {
                                Image(planet.name)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(height: planetSize)
                                Text(planet.name)
                                    .font(.title3)
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.inset)
                    .refreshable {
                        await model.downloadPlanets()
                    }
                    
                case .failure(let error):
                    Text(error.localizedDescription)
                        .foregroundStyle(.secondary)
                }
            }
            .task {
                await model.downloadPlanets()
            }
            .navigationTitle("Planetas")
        } detail: {
            NavigationStack {
                if let selectedPlanet = model.selectedPlanet {
                    PlanetView(planet: selectedPlanet, model: model)
                        .navigationTitle(selectedPlanet.name)
                        .navigationBarTitleDisplayMode(.inline)
                } else {
                    Text("Ningún planeta seleccionado")
                        .font(.title2.bold())
                        .foregroundStyle(.secondary)
                }                
            }
        }
    }
}

#Preview {
    PlanetsView()
}
