//
//  engine.swift
//  
//
//  Created by William Chuter-Davies on 6/25/25.
//

import Foundation

@Observable
class Engine{
    private(set) var population : Set<Cell> = []
    
    func setPopulation(to population: Set<Cell>) {
        self.population = population
    }
    
    func neighbors(of cell: Cell) -> [Cell] {
        var neighbors: [Cell] = []
        
        for dx in -1...1 {
            for dy in -1...1 {
                if dx != 0 || dy != 0 {
                    neighbors.append(Cell(x: cell.x + dx, y: cell.y + dy))
                }
            }
        }
        
        return neighbors
    }
    
    func step() {
        var neighborCountMap: [Cell: Int] = [:]
        var nextPopulation : Set<Cell> = []
        
        for cell in population {
            for neighbor in neighbors(of: cell) {
                neighborCountMap[neighbor, default: 0] += 1
            }
        }
        
        for (cell, count) in neighborCountMap {
            /* underpopulation condition (comment for clarity)
            if (liveCells.contains(cell) && count < 2) {
                continue
            }
            */
            // survival condition
            if (population.contains(cell) && (count == 2 || count == 3)) {
                nextPopulation.insert(cell)
            }
            /* overpopulation condition (comment for clarity)
            if (liveCells.contains(cell) && count > 3) {
                continue
            }
             */
            // reproduction condition
            if (count == 3) {
                nextPopulation.insert(cell)
            }
        }
        
        population = nextPopulation
    }
}
