//
//  AbstractSolverBoard.swift
//  Sudoku
//
//  Created by Erland Isaksson on 2019-06-22.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

class AbstractSolverBoard : BoardHandler {
    var size : Int
    var board: Array<Int?>
    var rows: Array<Array<Bool>>
    var rowsSum: Array<Array<Int>>
    var columns: Array<Array<Bool>>
    var columnsSum: Array<Array<Int>>
    let debug: Bool

    init(boardString: String, debug: Bool = true) {
        self.debug = debug
        size = AbstractSolverBoard.sizeOfBoard(boardString: boardString)
        board = Array<Int?>(repeating: nil, count:size * size)
        rows = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: size), count: size)
        rowsSum = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: size), count: size)
        columns = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: size), count: size)
        columnsSum = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: size), count: size)
        initializeBoard(boardString: boardString)
    }

    func sizeOfBoard() -> Int {
        return size
    }
    private class func sizeOfBoard(boardString: String) -> Int {
        switch boardString.count {
        case 36:
            return 6
        case 64:
            return 8
        case 100:
            return 10
        default:
            return 6
        }
    }
    
    func initializeBoard(boardString: String) {
        size = AbstractSolverBoard.sizeOfBoard(boardString: boardString)
        board = Array<Int?>(repeating: nil, count:size * size)
        rowsSum = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: size), count: size)
        columnsSum = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: size), count: size)
        
        for y in 0..<size {
            for x in 0..<size {
                let i = size*y+x
                if boardString.count > i {
                    let ch = boardString[boardString.index(boardString.startIndex, offsetBy: i)]
                    if ch != "_" && ch != "0" {
                        if let num = Int(String(ch)) {
                            setValue(x: x,y: y, value: num, present: true)
                        }
                    }
                }
            }
        }
        
    }

    func asString() -> String {
        var result = ""
        for i in 0..<(size*size) {
            if board[i] != nil {
                result = result + "\(board[i]!)"
            }else {
                result = result + "_"
            }
        }
        return result
    }
    
    func setValue(x: Int, y: Int, value: Int, present: Bool) {
        board[y*size+x] = value
        if present {
            rowsSum[y][value - 1] = rowsSum[y][value - 1] + 1
            columnsSum[x][value - 1] = columnsSum[x][value - 1] + 1
        }else {
            rowsSum[y][value - 1] = rowsSum[y][value - 1] - 1
            columnsSum[x][value - 1] = columnsSum[x][value - 1] - 1
        }
        if debug {
            print("Setting \(value) at \(x),\(y)")
        }
    }
    
    func valueAt(_ x: Int, _ y: Int) -> Int? {
        if x>=0 && x<size && y>=0 && y<size {
            return board[y*size+x]
        }else {
            return nil
        }
    }
    
    func printBoard() {
        for y in 0..<size {
            var rowString = ""
            for x in 0..<size {
                rowString = rowString + (valueAt(x,y) != nil ? String(valueAt(x,y)!) : " ")
                rowString = rowString + " "
            }
            
            print("\(rowString)")
        }
    }
    
    func isValid(x: Int, y: Int, value: Int) -> Bool {
        let currentValue = value - 1
        
        if rowsSum[y][currentValue] == size/2 || columnsSum[x][currentValue] == size/2 {
            return false
        }
        var nearByX = 0
        if isEqualTo(x: x+1, y: y, value: value) {
            nearByX = nearByX + 1
            if isEqualTo(x: x+2, y: y, value: value) {
                nearByX = nearByX + 1
            }
        }
        if isEqualTo(x: x-1, y: y, value: value) {
            nearByX = nearByX + 1
            if isEqualTo(x: x-2, y: y, value: value) {
                nearByX = nearByX + 1
            }
        }
        if nearByX>=2 {
            return false
        }
        var nearByY = 0
        if isEqualTo(x: x, y: y+1, value: value) {
            nearByY = nearByY + 1
            if isEqualTo(x: x, y: y+2, value: value) {
                nearByY = nearByY + 1
            }
        }
        if isEqualTo(x: x, y: y-1, value: value) {
            nearByY = nearByY + 1
            if isEqualTo(x: x, y: y-2, value: value) {
                nearByY = nearByY + 1
            }
        }
        if nearByY>=2 {
            return false
        }
        
        if duplicateRow(x: x, y: y, value: value) || duplicateColumn(x: x, y: y, value: value) {
            return false
        }

        return true
    }
    
    private func duplicateRow(x: Int, y: Int, value: Int) -> Bool {
        if rowsSum[y][0] + rowsSum[y][1] < size-1 {
            return false
        }
        var fullRows : [Int] = []
        for row in 0..<size {
            if row != y {
                var fullRow = true
                for column in 0..<size {
                    if board[row*size+column] == nil {
                        fullRow = false
                        break
                    }
                }
                if fullRow {
                    fullRows.append(row)
                }
            }
        }
        
        for row in fullRows {
            var equal = true
            for column in 0..<size {
                if column == x {
                    if board[row*size+column] != value {
                        equal = false
                        break
                    }
                }else {
                    if board[row*size+column] != board[y*size+column] {
                        equal = false
                        break
                    }
                }
            }
            if equal {
                return true
            }
        }
        return false
    }

    private func duplicateColumn(x: Int, y: Int, value: Int) -> Bool {
        if columnsSum[x][0] + columnsSum[x][1] < size-1 {
            return false
        }
        var fullColumns : [Int] = []
        for column in 0..<size {
            if column != x {
                var fullColumn = true
                for row in 0..<size {
                    if board[row*size+column] == nil {
                        fullColumn = false
                        break
                    }
                }
                if fullColumn{
                    fullColumns.append(column)
                }
            }
        }
        
        for column in fullColumns {
            var equal = true
            for row in 0..<size {
                if row == y {
                    if board[row*size+column] != value {
                        equal = false
                        break
                    }
                }else {
                    if board[row*size+column] != board[row*size+x] {
                        equal = false
                        break
                    }
                }
            }
            if equal {
                return true
            }
        }
        return false
    }
    
    private func isEqualTo(x: Int, y: Int, value: Int) -> Bool {
        if x>=0 && x<size && y>=0 && y<size && board[y*size+x] != nil && board[y*size+x] == value {
            return true
        }
        return false
    }
}
