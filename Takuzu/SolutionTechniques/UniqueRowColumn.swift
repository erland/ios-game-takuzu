//
//  UniqueRowColumn.swift
//  Takuzu
//
//  Created by Erland Isaksson on 2019-08-10.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation

class UniqueRowColumn : SolverTechnique {
    func solvePosition(board: BoardHandler, x: Int, y: Int) -> Bool {
        if isOnlyRemainingOnRow(board: board, x: x, y: y) {
            if let opposite = oppositeFromOtherSimilarRow(board: board, x: x, y: y) {
                if board.isValid(x: x, y: y, value: opposite) {
                    board.setValue(x: x, y: y, value: opposite, present: true)
                    return true
                }
            }
        }
        if isOnlyRemainingOnColumn(board: board, x: x, y: y) {
            if let opposite = oppositeFromOtherSimilarColumn(board: board, x: x, y: y) {
                if board.isValid(x: x, y: y, value: opposite) {
                    board.setValue(x: x, y: y, value: opposite, present: true)
                    return true
                }
            }
        }
        return false
    }
    
    func isOnlyRemainingOnRow(board: BoardHandler, x: Int, y: Int) -> Bool {
        var emptyOnRow = 0
        for posX in 0..<board.sizeOfBoard() {
            if board.valueAt(posX, y) == nil && posX != x {
                emptyOnRow = emptyOnRow + 1
            }
        }
        if emptyOnRow > 1 {
            return false
        }
        return true
    }

    func isOnlyRemainingOnColumn(board: BoardHandler, x: Int, y: Int) -> Bool {
        var emptyOnColumn = 0
        for posY in 0..<board.sizeOfBoard() {
            if board.valueAt(x, posY) == nil && posY != y {
                emptyOnColumn = emptyOnColumn + 1
            }
        }
        if emptyOnColumn > 1 {
            return false
        }
        return true
    }
    
    func oppositeFromOtherSimilarRow(board: BoardHandler, x: Int, y: Int) -> Int? {
        for row in 0..<board.sizeOfBoard() {
            if row != y {
                var match = true
                for column in 0..<board.sizeOfBoard() {
                    if column != x && board.valueAt(column, y) != nil && board.valueAt(column, y) != board.valueAt(column, row) {
                        match = false
                        break
                    }
                }
                if match {
                    return oppositeValue(board.valueAt(x, row))
                }
            }
        }
        return nil
    }
    
    func oppositeFromOtherSimilarColumn(board: BoardHandler, x: Int, y: Int) -> Int? {
        for column in 0..<board.sizeOfBoard() {
            if column != x {
                var match = true
                for row in 0..<board.sizeOfBoard() {
                    if row != y && board.valueAt(x, row) != nil && board.valueAt(x, row) != board.valueAt(column, row) {
                        match = false
                        break
                    }
                }
                if match {
                    return oppositeValue(board.valueAt(column, y))
                }
            }
        }
        return nil
    }
    
    func oppositeValue(_ value: Int?) -> Int? {
        if let value = value {
            switch value {
            case 1:
                return 2
            case 2:
                return 1
            default:
                return nil
            }
        }
        return nil
    }
}
