//
//  Board.swift
//  Battleship
//
//  Created by Erland Isaksson on 2019-04-29.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import SpriteKit

protocol BoardObserver : class {
    func numberAdded(number: Number)
    func numberRemoved(number: Number)
}
class Board {
    let name: String
    let width: Int
    let height: Int
    let board: Array2D<Number>
    var numbers: Set<Number> = Set()
    var observers: [BoardObserver] = []
    let debug = false
    
    init(name: String, width: Int, height: Int) {
        self.name = name
        self.width = width
        self.height = height
        self.board = Array2D<Number>(columns: width, rows: height)
    }
    
    init(name: String, board: Array2D<Number>) {
        self.name = name
        self.width = board.columns
        self.height = board.rows
        self.board = board
    }
    
    convenience init(name: String, boardNumbers: String) {
        switch boardNumbers.count {
        case 36:
            self.init(name: name, width: 6, height: 6)
        case 64:
            self.init(name: name, width: 8, height: 8)
        case 100:
            self.init(name: name, width: 10, height: 10)
        default:
            self.init(name: name, width: 6, height: 6)
        }
        for y in 0..<height {
            for x in 0..<width {
                let i = width*y+x
                if boardNumbers.count > i {
                    let ch = boardNumbers[boardNumbers.index(boardNumbers.startIndex, offsetBy: i)]
                    if ch != "_" {
                        if let num = Int(String(ch)) {
                            addPermanentNumber(number: num, x: x, y: y)
                        }
                    }
                }
            }
        }
    }
    
    func attachObserver(_ observer: BoardObserver) {
        for number in numbers {
            observer.numberAdded(number: number)
        }
        observers.append(observer)
    }
    
    func detachObserver(_ observer: BoardObserver) {
        if let index = (self.observers.firstIndex(where: { $0 === observer })) {
            self.observers.remove(at: index)
        }
    }
    
    func atPosition(_ x: Int, _ y: Int) -> Number? {
        if x>=0 && x<width && y>=0 && y<height {
            return board[x, y]
        }else {
            return nil
        }
    }
    
    private func isInsideBoard(_ x: Int, _ y: Int) -> Bool {
        if x<0 || x >= width {
            // Outside board
            if debug {
                print("Outside board")
            }
            return false
        }else if y<0 || y >= height {
            if debug {
                print("Outside board")
            }
            return false
        }
        return true
    }
    
    func removeNumber(x: Int, y: Int) {
        if !isInsideBoard(x, y) {
            return
        }
        if board[x,y] == nil {
            return
        }
        if let n = board[x,y] {
            if !n.permanent {
                board[x,y] = nil
                numbers.remove(n)
                for observer in observers {
                    observer.numberRemoved(number: n)
                }
            }

        }
        
    }
    
    func addFinalNumber(number: Int, x: Int, y: Int, permanent: Bool = false) {
        if !isInsideBoard(x, y) {
            return
        }
        if board[x,y] != nil && (board[x,y]!.final || board[x,y]!.permanent) {
            // Already occupied
            if debug {
                print("Already occupied")
            }
            return
        }
        
        var addedNumber : Bool = false
        var n = board[x,y]
        if n == nil {
            addedNumber = true
            n = Number(x, y)
        }
        n!.final = !permanent
        n!.permanent = permanent
        n!.number = number
        n!.error = !isValidBoard(number: n!)
        if addedNumber {
            board[x,y] = n
            numbers.insert(n!)
            for observer in observers {
                observer.numberAdded(number: n!)
            }
        }
        
        if debug {
            print("Board(\(name)): Added \(number) at: \(x),\(y)")
            debugBoard()
        }
    }
    

    func addPermanentNumber(number: Int, x: Int, y: Int) {
        addFinalNumber(number: number, x: x, y: y, permanent: true)
    }

    
    func isValidBoard(number: Number) -> Bool {
        var noInRow = 0
        for x in 0..<width {
            if x == number.x {
                noInRow = noInRow + 1
            }else if let n = board[x,number.y] {
                if n.number == number.number {
                    noInRow = noInRow + 1
                }
            }
        }
        if noInRow>width/2 {
            return false
        }
        var noInColumn = 0
        for y in 0..<height {
            if y == number.y {
                noInColumn = noInColumn + 1
            }else if let n = board[number.x,y] {
                if n.number == number.number {
                    noInColumn = noInColumn + 1
                }
            }
        }
        if noInColumn>height/2 {
            return false
        }
        var nearByX = 0
        if isEqualTo(x: number.x-1,y: number.y,number: number.number!) {
            nearByX = nearByX + 1
            if isEqualTo(x: number.x-2,y: number.y,number: number.number!) {
                nearByX = nearByX + 1
            }
        }
        if isEqualTo(x: number.x+1,y: number.y,number: number.number!) {
            nearByX = nearByX + 1
            if isEqualTo(x: number.x+2,y: number.y,number: number.number!) {
                nearByX = nearByX + 1
            }
        }
        if nearByX>=2 {
            return false
        }
        
        var nearByY = 0
        if isEqualTo(x: number.x,y: number.y-1,number: number.number!) {
            nearByY = nearByY + 1
            if isEqualTo(x: number.x,y: number.y-2,number: number.number!) {
                nearByY = nearByY + 1
            }
        }
        if isEqualTo(x: number.x,y: number.y+1,number: number.number!) {
            nearByY = nearByY + 1
            if isEqualTo(x: number.x,y: number.y+2,number: number.number!) {
                nearByY = nearByY + 1
            }
        }
        if nearByY>=2 {
            return false
        }

        return true
    }
        
    private func isEqualTo(x: Int, y: Int, number: Int) -> Bool {
        if x>=0 && x<width && y>=0 && y<height && board[x,y] != nil && board[x,y]!.number == number {
            return true
        }
        return false
    }
    
    func isAllNumbersPlaced() -> Bool {
        var result = true
        for y in 0..<height {
            for x in 0..<width {
                if board[x,y] == nil {
                    result = false
                    break
                }else if !(board[x,y]!.permanent || board[x,y]!.final) {
                    result = false
                    break
                }
            }
            if !result {
                break
            }
        }
        return result
    }
    
    func isCompleted() -> Bool {
        if !isAllNumbersPlaced() {
            return false
        }
        var result = true
        for y in 0..<height {
            for x in 0..<width {
                if board[x,y]!.error {
                    result = false
                    break
                }
            }
            if !result {
                break
            }
        }
        return result
    }

    


    func asString() -> String {
        var result = ""
        for y in 0..<height {
            for x in 0..<width {
                if board[x,y] != nil {
                    let n = board[x,y]
                    if n!.permanent || n!.final {
                        result = result + "\(n!.number!)"
                    }else {
                        result = result + "_"
                    }
                }else {
                    result = result + "_"
                }
            }
        }
        return result
    }
    
    func debugBoard(debug: Bool? = nil) {
        if self.debug || (debug != nil && debug!) {
            
            print("Board contents")
            for y in 0..<height {
                for x in 0..<width {
                    if board[x,y] != nil {
                        let n = board[x,y]
                        if n!.permanent || n!.final {
                            print("\(n!.number!)", terminator: "")
                        }else {
                            print("_", terminator: "")
                        }
                    }else {
                        print("_", terminator: "")
                    }
                }
                print()
            }
        }
    }
    
}
