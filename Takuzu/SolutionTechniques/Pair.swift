//
//  Pair.swift
//  Takuzu
//
//  Created by Erland Isaksson on 2019-08-10.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation

class Pair : SolverTechnique {
    func solvePosition(board: BoardHandler, x: Int, y: Int) -> Bool {
        // Pair to the left
        if let cellValue = board.valueAt(x-1, y) {
            if board.valueAt(x-2,y) == cellValue {
                if board.isValid(x: x, y: y, value: oppositeValueOf(value: cellValue)) {
                    board.setValue(x: x, y: y, value: oppositeValueOf(value: cellValue), present: true)
                    return true
                }
            }
        }
        // Pair to the right
        if let cellValue = board.valueAt(x+1, y) {
            if board.valueAt(x+2,y) == cellValue {
                if board.isValid(x: x, y: y, value: oppositeValueOf(value: cellValue)) {
                    board.setValue(x: x, y: y, value: oppositeValueOf(value: cellValue), present: true)
                    return true
                }
            }
        }
        // Pair above
        if let cellValue = board.valueAt(x, y-1) {
            if board.valueAt(x,y-2) == cellValue {
                if board.isValid(x: x, y: y, value: oppositeValueOf(value: cellValue)) {
                    board.setValue(x: x, y: y, value: oppositeValueOf(value: cellValue), present: true)
                    return true
                }
            }
        }
        // Pair below
        if let cellValue = board.valueAt(x, y+1) {
            if board.valueAt(x,y+2) == cellValue {
                if board.isValid(x: x, y: y, value: oppositeValueOf(value: cellValue)) {
                    board.setValue(x: x, y: y, value: oppositeValueOf(value: cellValue), present: true)
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
