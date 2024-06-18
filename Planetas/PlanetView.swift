//
//  PlanetView.swift
//  Planetas
//
//  Created by Erick Daniel Padilla on 14/08/23.
//

import SwiftUI

struct PlanetView: View {
    @Bindable var planet: Planet
    var model: PlanetsViewModel
    
    @State private var isShowingAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                Image(planet.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                    .padding(.horizontal, 32)
                VStack(spacing: 12) {
                    Text(planet.name)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    TextField("Descripción del planeta", text: $planet.description, axis: .vertical)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                }
                Button("Mostrar alerta", systemImage: "info.circle", action: showAlert)
                Button("Deseleccionar", systemImage: "xmark.circle", action: unselectPlanet)
            }
            .padding(32)
        }
        .alert(planet.name, isPresented: $isShowingAlert) {
            Button("OK", role: .cancel, action: {})
        } message: {
            Text(planet.description)
        }
    }
    
    func showAlert() {
        isShowingAlert = true
    }
    
    func unselectPlanet() {
        model.selectedPlanet = nil
    }
}

#Preview {
    PlanetView(planet: planetList[2], model: .init())
}
