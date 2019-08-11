//
//  CompleteRowColumn.swift
//  Takuzu
//
//  Created by Erland Isaksson on 2019-08-10.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation

class CompleteRowColumn : SolverTechnique {
    func solvePosition(board: BoardHandler, x: Int, y: Int) -> Bool {
        
        var sums : [Int] = [0,0]
        for posX in 0..<board.sizeOfBoard() {
            if let cellValue = board.valueAt(posX, y) {
                sums[cellValue-1] = sums[cellValue-1] + 1
            }
        }
        if sums[0]==board.sizeOfBoard()/2 {
            if board.isValid(x: x, y: y, value: 2) {
                board.setValue(x: x, y: y, value: 2, present: true)
                return true
            }
        }else if sums[1]==board.sizeOfBoard()/2 {
            if board.isValid(x: x, y: y, value: 1) {
                board.setValue(x: x, y: y, value: 1, present: true)
                return true
            }
        }

        sums = [0,0]
        for posY in 0..<board.sizeOfBoard() {
            if let cellValue = board.valueAt(x, posY) {
                sums[cellValue-1] = sums[cellValue-1] + 1
            }
        }
        if sums[0]==board.sizeOfBoard()/2 {
            if board.isValid(x: x, y: y, value: 2) {
                board.setValue(x: x, y: y, value: 2, present: true)
                return true
            }
        }else if sums[1]==board.sizeOfBoard()/2 {
            if board.isValid(x: x, y: y, value: 1) {
                board.setValue(x: x, y: y, value: 1, present: true)
                return true
            }
        }

        return false
    }
    
}
