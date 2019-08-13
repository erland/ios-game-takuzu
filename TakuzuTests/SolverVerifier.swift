//
//  SolverVerifier.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-13.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

@testable import Takuzu

class SolverVerifier : SolverObserver {
    var values : [Int?]
    let size : Int
    
    init(size: Int) {
        self.size = size
        values = Array<Int?>(repeating: nil, count:size * size)
    }
    
    subscript(column: Int, row: Int) -> Int? {
        get {
            return values[(row * size) + column]
        }
        set(newValue) {
            values[(row * size) + column] = newValue
        }
    }

    func solverSetValue(x: Int, y: Int, value: Int) {
        values[y*size+x] = value
    }

    func solverRemovedCandidate(x: Int, y: Int, value: Int) {
        // Not used
    }
    
}
