//
//  ContentView.swift
//  life
//
//  Created by William Chuter-Davies on 8/11/25.
//

import SwiftUI

struct ContentView: View {
    let engine = Engine()
    let seed: Set<Cell> = [
        Cell(x: 0, y: 0),
        Cell(x: -1, y: 0),
        Cell(x: 1, y: 0)
    ]
    
    init() {
        engine.setPopulation(to: seed)
    }
    
    var body: some View {
        VStack {
            Button("step") {
                engine.step()
            }
            Text("Live cell count: \(engine.population.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
