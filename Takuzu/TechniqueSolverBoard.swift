//
//  DifficultyCalculator.swift
//  Sudoku
//
//  Created by Erland Isaksson on 2019-06-17.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation


protocol SolverObserver : class {
    func solverRemovedCandidate(x: Int, y: Int, value: Int)
    func solverSetValue(x: Int, y: Int, value: Int)
}

class TechniqueSolverBoard : AbstractSolverBoard {
    var observers: [SolverObserver] = []

    func attachObserver(_ observer: SolverObserver) {
        observers.append(observer)
    }
    
    func detachObserver(_ observer: SolverObserver) {
        if let index = (self.observers.firstIndex(where: { $0 === observer })) {
            self.observers.remove(at: index)
        }
    }

    func solve(techniques: [SolverTechnique]) -> Bool {
        var makesProgress = true
        while makesProgress {
            makesProgress = false
            for t in techniques {
                if solve(technique: t) {
                    makesProgress = true
                    break
                }
            }
        }
        for i in 0..<(size*size) {
            if board[i] == nil {
                return false
            }
        }
        return true
    }
    
    func solve(technique: SolverTechnique) -> Bool {
        for y in 0..<size {
            for x in 0..<size {
                if board[y*size+x] == nil {
                    if technique.solvePosition(board: self, x: x, y: y) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    override func setValue(x: Int, y: Int, value: Int, present: Bool) {
        super.setValue(x: x, y: y, value: value, present: present)
        for observer in observers {
            observer.solverSetValue(x: x, y: y, value: value)
        }
    }
    
}
