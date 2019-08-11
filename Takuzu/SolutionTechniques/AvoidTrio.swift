//
//  AvoidTrio.swift
//  Takuzu
//
//  Created by Erland Isaksson on 2019-08-10.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation

class AvoidTrio : SolverTechnique {
    func solvePosition(board: BoardHandler, x: Int, y: Int) -> Bool {
        
        // Horizontal trio
        if let value = board.valueAt(x-1, y) {
            if board.valueAt(x+1, y) == value {
                if board.isValid(x: x, y: y, value: oppositeValueOf(value: value)) {
                    board.setValue(x: x, y: y, value: oppositeValueOf(value: value), present: true)
                    return true
                }
            }
        }
        // Vertical trio
        if let value = board.valueAt(x, y-1) {
            if board.valueAt(x, y+1) == value {
                if board.isValid(x: x, y: y, value: oppositeValueOf(value: value)) {
                    board.setValue(x: x, y: y, value: oppositeValueOf(value: value), present: true)
                    return true
                }
            }
        }
        return false
    }
    
    func oppositeValueOf(value: Int) -> Int {
        if value == 1 {
            return 2
        }else {
            return 1
        }
    }
}
