//
//  engine.swift
//  
//
//  Created by William Chuter-Davies on 6/25/25.
//

class Engine {
    private(set) var liveCells : Set<Cell> = []
    
    func setLiveCells(to cells: Set<Cell>) {
        liveCells = cells
    }
    
    func neighbors(of cell: Cell) -> [Cell] {
        var results: [Cell] = []
        
        for dx in -1...1 {
            for dy in -1...1 {
                if dx != 0 || dy != 0 {
                    results.append(Cell(x: cell.x + dx, y: cell.y + dy))
                }
            }
        }
        
        return results
    }
    
    func step() {
        var neighborCounts: [Cell: Int] = [:]
        var newLiveCells : Set<Cell> = []
        
        for liveCell in liveCells {
            for neighbor in neighbors(of: liveCell) {
                neighborCounts[neighbor, default: 0] += 1
            }
        }
        
        for (cell, count) in neighborCounts {
            /* underpopulation condition (comment for clarity)
            if (liveCells.contains(cell) && count < 2) {
                continue
            }
            */
            // survival condition
            if (liveCells.contains(cell) && (count == 2 || count == 3)) {
                newLiveCells.insert(cell)
            }
            /* overpopulation condition (comment for clarity)
            if (liveCells.contains(cell) && count > 3) {
                continue
            }
             */
            // reproduction condition
            if (count == 3) {
                newLiveCells.insert(cell)
            }
        }
        
        liveCells = newLiveCells
    }
}
