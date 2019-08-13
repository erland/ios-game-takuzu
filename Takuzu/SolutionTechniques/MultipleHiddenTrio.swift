//
//  MultipleHiddenTrio.swift
//  Takuzu
//
//  Created by Erland Isaksson on 2019-08-13.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation

class MultipleHiddenTrio : SolverTechnique {
    func solvePosition(board: BoardHandler, x: Int, y: Int) -> Bool {
        
        if checkRows(board: board, x: x, y: y) {
            return true
        }
        if checkColumns(board: board, x: x, y: y) {
            return true
        }
        return false
    }
    
    private func dangerNumberFromSums(sums: [Int]) -> Int {
        var dangerNumber = 1
        if sums[1]<sums[0] {
            dangerNumber = 2
        }
        return dangerNumber
    }
    func checkRows(board: BoardHandler, x: Int, y: Int) -> Bool {
        var sums : [Int] = [0,0]
        for posX in 0..<board.sizeOfBoard() {
            if let cellValue = board.valueAt(posX, y) {
                sums[cellValue-1] = sums[cellValue-1] + 1
            }
        }
        if sums[0] + sums[1] == board.sizeOfBoard()-5 {
            let dangerNumber = dangerNumberFromSums(sums: sums)
            
            var dangerCandidatePositions : [Int] = []
            var dangerPositions : [[Int]] = []
            var candidateIsDanger = false
            for posX in 0..<board.sizeOfBoard() {
                if board.valueAt(posX, y) == nil {
                    dangerCandidatePositions.append(posX)
                }else if board.valueAt(posX,y) == dangerNumber {
                    if dangerCandidatePositions.count>=2 {
                        if dangerCandidatePositions.count > 2 && !candidateIsDanger {
                            dangerCandidatePositions.removeFirst()
                        }
                        dangerPositions.append(dangerCandidatePositions)
                    }
                    dangerCandidatePositions.removeAll()
                    candidateIsDanger = true
                }else {
                    if dangerCandidatePositions.count>=2 && candidateIsDanger {
                        if dangerCandidatePositions.count > 2 {
                            dangerCandidatePositions.removeLast()
                        }
                        dangerPositions.append(dangerCandidatePositions)
                    }
                    dangerCandidatePositions.removeAll()
                    candidateIsDanger = false
                }
            }
            if dangerCandidatePositions.count>=2 && candidateIsDanger {
                dangerPositions.append(dangerCandidatePositions)
            }
            if isAllDanger(dangerPositions: dangerPositions, currentPos: x) {
                if board.isValid(x: x, y: y, value: dangerNumber) {
                    board.setValue(x: x, y: y, value: dangerNumber, present: true)
                    return true
                }
            }
        }
        return false
    }
    
    private func isAllDanger(dangerPositions: [[Int]], currentPos: Int) -> Bool {
        if dangerPositions.count<2 {
            return false
        }
        var match = true
        for positions in dangerPositions {
            if positions.contains(currentPos) {
                match = false
                break
            }
        }
        return match
    }
    
    func checkColumns(board: BoardHandler, x: Int, y: Int) -> Bool {
        var sums : [Int] = [0,0]
        for posY in 0..<board.sizeOfBoard() {
            if let cellValue = board.valueAt(x, posY) {
                sums[cellValue-1] = sums[cellValue-1] + 1
            }
        }
        if sums[0] + sums[1] == board.sizeOfBoard()-5 {
            let dangerNumber = dangerNumberFromSums(sums: sums)
            
            var dangerCandidatePositions : [Int] = []
            var dangerPositions : [[Int]] = []
            var candidateIsDanger = false
            for posY in 0..<board.sizeOfBoard() {
                if board.valueAt(x, posY) == nil {
                    dangerCandidatePositions.append(posY)
                }else if board.valueAt(x,posY) == dangerNumber {
                    if dangerCandidatePositions.count>=2 {
                        if dangerCandidatePositions.count > 2 && !candidateIsDanger {
                            dangerCandidatePositions.removeFirst()
                        }
                        dangerPositions.append(dangerCandidatePositions)
                    }
                    dangerCandidatePositions.removeAll()
                    candidateIsDanger = true
                }else {
                    if dangerCandidatePositions.count>=2 && candidateIsDanger {
                        if dangerCandidatePositions.count > 2 {
                            dangerCandidatePositions.removeLast()
                        }
                        dangerPositions.append(dangerCandidatePositions)
                    }
                    dangerCandidatePositions.removeAll()
                    candidateIsDanger = false
                }
            }
            if dangerCandidatePositions.count>=2 && candidateIsDanger {
                dangerPositions.append(dangerCandidatePositions)
            }
            if isAllDanger(dangerPositions: dangerPositions, currentPos: y) {
                if board.isValid(x: x, y: y, value: dangerNumber) {
                    board.setValue(x: x, y: y, value: dangerNumber, present: true)
                    return true
                }
            }
        }
        return false
    }
}
