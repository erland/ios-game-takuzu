//
//  TakuzuTests.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-12.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import XCTest
@testable import Takuzu

class PairTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInBeginningOfRowTwos() {
        let boardString = [
            "22____",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }

    func testInBeginningOfRow() {
        let boardString = [
            "11____",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInEndOfRow() {
        let boardString = [
            "____11",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfRow() {
        let boardString = [
            "__11__",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfRowWithNumberToLeft() {
        let boardString = [
            "_211__",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfRowWithNumberToRight() {
        let boardString = [
            "__112_",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfRowWithSurroundingNumbers() {
        let boardString = [
            "_2112_",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: Pair()))
    }
    func testInBeginningOfRowWithNumberToRight() {
        let boardString = [
            "112___",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: Pair()))
    }
    func testInEndOfRowWithNumberToLeft() {
        let boardString = [
            "___211",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: Pair()))
    }
    
    func testInTopOfColumn() {
        let boardString = [
            "_1____",
            "_1____",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInBottomOfColumn() {
        let boardString = [
            "______",
            "______",
            "______",
            "______",
            "____1_",
            "____1_"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfColumn() {
        let boardString = [
            "______",
            "______",
            "____1_",
            "____1_",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfColumnWithNumberAbove() {
        let boardString = [
            "______",
            "____2_",
            "____1_",
            "____1_",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfColumnWithNumberBelow() {
        let boardString = [
            "______",
            "______",
            "____1_",
            "____1_",
            "____2_",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: Pair()))
    }
    func testInMiddleOfColumnWithSurroundingNumbers() {
        let boardString = [
            "______",
            "____2_",
            "____1_",
            "____1_",
            "____2_",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: Pair()))
    }
    func testInTopOfColumnWithNumberBelow() {
        let boardString = [
            "_1____",
            "_1____",
            "_2____",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: Pair()))
    }
    func testInBottomOfColumnWithNumberTAbove() {
        let boardString = [
            "______",
            "______",
            "______",
            "____2_",
            "____1_",
            "____1_"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: Pair()))
    }
}
