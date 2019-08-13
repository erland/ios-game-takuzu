//
//  AbstractSolverBoardTests.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-13.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import XCTest
@testable import Takuzu

class AbstractSolverBoardTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testisValidNegativeWithDuplicateRowBelow() {
        let boardString = [
            "______",
            "_12121",
            "212121",
            "______",
            "______",
            "______"
        ]
        let board = AbstractSolverBoard(boardString: boardString.joined())
        XCTAssert(!board.isValid(x: 0, y: 1, value: 2))
    }

    func testisValidNegativeWithDuplicateRowAbove() {
        let boardString = [
            "______",
            "212121",
            "_12121",
            "______",
            "______",
            "______"
        ]
        let board = AbstractSolverBoard(boardString: boardString.joined())
        XCTAssert(!board.isValid(x: 0, y: 2, value: 2))
    }

    func testisValidNegativeWithDuplicateRowOnRight() {
        let boardString = [
            "__2___",
            "_11___",
            "_22___",
            "_11___",
            "_22___",
            "_11___"
        ]
        let board = AbstractSolverBoard(boardString: boardString.joined())
        XCTAssert(!board.isValid(x: 1, y: 0, value: 2))
    }
    
    func testisValidNegativeWithDuplicateRowOnLeft() {
        let boardString = [
            "_1____",
            "_22___",
            "_11___",
            "_22___",
            "_11___",
            "_12___"
        ]
        let board = AbstractSolverBoard(boardString: boardString.joined())
        XCTAssert(!board.isValid(x: 2, y: 0, value: 2))
    }
}
