//
//  Number.swift
//  Sudoku
//
//  Created by Erland Isaksson on 2019-06-14.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//


import SpriteKit

protocol NumberObserver {
    func numberUpdated(number: Number)
}

class Number : Hashable, NSCopying {
    var observers: [NumberObserver] = []
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
        self.final = false
        self.permanent = false
        self.error = false
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Number(self.x,self.y)
        copy.permanent = self.permanent
        copy.final = self.final
        
        return copy
    }
    
    func attachObserver(observer: NumberObserver) {
        observers.append(observer)
    }
    
    private func notifyObservers() {
        for observer in observers {
            observer.numberUpdated(number: self)
        }
    }
    var x: Int {
        didSet {
            notifyObservers()
        }
    }
    var y: Int {
        didSet {
            notifyObservers()
        }
    }
    var number: Int? {
        didSet {
            notifyObservers()
        }
    }
    var permanent: Bool {
        didSet {
            notifyObservers()
        }
    }
    var error: Bool {
        didSet {
            notifyObservers()
        }
    }
    var final: Bool {
        didSet {
            notifyObservers()
        }
    }
    static func == (lhs: Number, rhs: Number) -> Bool {
        return lhs === rhs
    }
    var hashValue: Int {
        return x.hashValue ^ y.hashValue
    }
}

