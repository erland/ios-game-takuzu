//
//  AvoidTrioTests.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-12.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import XCTest
@testable import Takuzu

class AvoidTrioTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRowMiddleTwos() {
        let boardString = [
            "______",
            "_2_2__",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }

    func testRowMiddleOnes() {
        let boardString = [
            "______",
            "_1_1__",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }
    
    func testRowLeft() {
        let boardString = [
            "______",
            "1_1___",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }

    func testRowRight() {
        let boardString = [
            "______",
            "___1_1",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }

    func testRowOtherOnSides() {
        let boardString = [
            "______",
            "21_12_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }

    func testRowMultiple() {
        let boardString = [
            "______",
            "1_1_1_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }

    func testRowSingleLeft() {
        let boardString = [
            "______",
            "_1____",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: AvoidTrio()))
    }

    func testRowSingleRight() {
        let boardString = [
            "______",
            "____1_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: AvoidTrio()))
    }
    func testRowAlreadyFilled() {
        let boardString = [
            "______",
            "__121_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: AvoidTrio()))
    }

    func testColumnMiddleTwos() {
        let boardString = [
            "______",
            "_2____",
            "______",
            "_2____",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }
    
    func testColumnMiddleOnes() {
        let boardString = [
            "______",
            "_1____",
            "______",
            "_1____",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }
    
    func testColumnTop() {
        let boardString = [
            "_1____",
            "______",
            "_1____",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }
    
    func testColumnBottom() {
        let boardString = [
            "______",
            "______",
            "______",
            "_1____",
            "______",
            "_1____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }
    
    func testColumnOtherOnSides() {
        let boardString = [
            "_2____",
            "_1____",
            "______",
            "_1____",
            "_2____",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }
    
    func testColumnMultiple() {
        let boardString = [
            "_1____",
            "______",
            "_1____",
            "______",
            "_1____",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: AvoidTrio()))
    }
    
    func testColumnSingleTop() {
        let boardString = [
            "______",
            "__1___",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: AvoidTrio()))
    }
    
    func testColumnSingleBottom() {
        let boardString = [
            "______",
            "______",
            "______",
            "______",
            "__1___",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: AvoidTrio()))
    }
    func testColumnAlreadyFilled() {
        let boardString = [
            "______",
            "__1___",
            "__2___",
            "__1___",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: AvoidTrio()))
    }
}
