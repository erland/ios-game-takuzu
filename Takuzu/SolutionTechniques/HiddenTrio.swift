//
//  HiddenTrio.swift
//  Takuzu
//
//  Created by Erland Isaksson on 2019-08-10.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation

class HiddenTrio : SolverTechnique {
    func solvePosition(board: BoardHandler, x: Int, y: Int) -> Bool {
        
        var sums : [Int] = [0,0]
        for posX in 0..<board.sizeOfBoard() {
            if let cellValue = board.valueAt(posX, y) {
                sums[cellValue-1] = sums[cellValue-1] + 1
            }
        }
        if sums[0] + sums[1] == board.sizeOfBoard()-3 {
            if board.valueAt(0, y) == nil && board.valueAt(1, y) == nil && board.valueAt(2, y) == nil {
                if sums[0]==board.sizeOfBoard()/2-1 && board.valueAt(3, y) == 2 {
                    if board.isValid(x: 0, y: y, value: 2) {
                        board.setValue(x: 0, y: y, value: 2, present: true)
                        return true
                    }
                }else if sums[1]==board.sizeOfBoard()/2-1 && board.valueAt(3, y) == 1 {
                    if board.isValid(x: 0, y: y, value: 1) {
                        board.setValue(x: 0, y: y, value: 1, present: true)
                        return true
                    }
                }
            }
            if board.valueAt(board.sizeOfBoard()-1, y) == nil && board.valueAt(board.sizeOfBoard()-2, y) == nil && board.valueAt(board.sizeOfBoard()-3, y) == nil {
                if sums[0]==board.sizeOfBoard()/2-1 && board.valueAt(board.sizeOfBoard()-4, y) == 2 {
                    if board.isValid(x: board.sizeOfBoard()-1, y: y, value: 2) {
                        board.setValue(x: board.sizeOfBoard()-1, y: y, value: 2, present: true)
                        return true
                    }
                }else if sums[1]==board.sizeOfBoard()/2-1 && board.valueAt(board.sizeOfBoard()-4, y) == 1 {
                    if board.isValid(x: board.sizeOfBoard()-1, y: y, value: 1) {
                        board.setValue(x: board.sizeOfBoard()-1, y: y, value: 1, present: true)
                        return true
                    }
                }
            }
        }

        sums = [0,0]
        for posY in 0..<board.sizeOfBoard() {
            if let cellValue = board.valueAt(x, posY) {
                sums[cellValue-1] = sums[cellValue-1] + 1
            }
        }
        if sums[0] + sums[1] == board.sizeOfBoard()-3 {
            if board.valueAt(x, 0) == nil && board.valueAt(x, 1) == nil && board.valueAt(x,2) == nil {
                if sums[0]==board.sizeOfBoard()/2-1 && board.valueAt(x,3) == 2 {
                    if board.isValid(x: x, y: 0, value: 2) {
                        board.setValue(x: x, y: 0, value: 2, present: true)
                        return true
                    }
                }else if sums[1]==board.sizeOfBoard()/2-1 && board.valueAt(x,3) == 1 {
                    if board.isValid(x: x, y: 0, value: 1) {
                        board.setValue(x: x, y: 0, value: 1, present: true)
                        return true
                    }
                }
            }
            if board.valueAt(x,board.sizeOfBoard()-1) == nil && board.valueAt(x,board.sizeOfBoard()-2) == nil && board.valueAt(x,board.sizeOfBoard()-3) == nil {
                if sums[0]==board.sizeOfBoard()/2-1 && board.valueAt(x,board.sizeOfBoard()-4) == 2 {
                    if board.isValid(x: x, y: board.sizeOfBoard()-1, value: 2) {
                        board.setValue(x: x, y: board.sizeOfBoard()-1, value: 2, present: true)
                        return true
                    }
                }else if sums[1]==board.sizeOfBoard()/2-1 && board.valueAt(x,board.sizeOfBoard()-4) == 1 {
                    if board.isValid(x: x, y: board.sizeOfBoard()-1, value: 1) {
                        board.setValue(x: x, y: board.sizeOfBoard()-1, value: 1, present: true)
                        return true
                    }
                }
            }
        }
        return false
    }
}
