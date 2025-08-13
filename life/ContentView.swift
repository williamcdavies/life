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
        Cell(x: 0, y: 0)
    ]
    
    init() {
        engine.setPopulation(to: seed)
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
