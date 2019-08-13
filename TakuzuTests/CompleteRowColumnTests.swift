//
//  CompleteRowColumnTests.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-12.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import XCTest
@testable import Takuzu

class CompleteRowColumnTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRowOneRemainingOnLeftMoreOnes() {
        let boardString = [
            "______",
            "_12121",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }

    func testRowOneRemainingOnLeftMoreTwos() {
        let boardString = [
            "______",
            "_21212",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }

    func testRowOneRemainingOnRightMoreOnes() {
        let boardString = [
            "______",
            "12121_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }
    
    func testRowOneRemainingOnRightMoreTwos() {
        let boardString = [
            "______",
            "21212_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }

    func testRowAllTwosRemaining() {
        let boardString = [
            "______",
            "_1_1_1",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }

    func testRowAllOnesRemaining() {
        let boardString = [
            "______",
            "_2_2_2",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }

    func testRowBothOnesAndTwosRemains() {
        let boardString = [
            "______",
            "_1212_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }

    func testRowBothOnesAndTwosRemainsMoreOnes() {
        let boardString = [
            "______",
            "_121__",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }

    func testRowBothOnesAndTwosRemainsMoreTwos() {
        let boardString = [
            "______",
            "__212_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
    
    func testAllRemains() {
        let boardString = [
            "______",
            "______",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }

    func testRowNoRemainsSplit() {
        let boardString = [
            "______",
            "111222",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
    func testRowNoRemainsSpread() {
        let boardString = [
            "______",
            "121212",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnOneRemainingOnTopMoreOnes() {
        let boardString = [
            "______",
            "_1____",
            "_2____",
            "_1____",
            "_2____",
            "_1____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnOneRemainingOnTopMoreTwos() {
        let boardString = [
            "______",
            "_2____",
            "_1____",
            "_2____",
            "_1____",
            "_2____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnOneRemainingOnBottomMoreOnes() {
        let boardString = [
            "_1____",
            "_2____",
            "_1____",
            "_2____",
            "_1____",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnOneRemainingOnBottomMoreTwos() {
        let boardString = [
            "_2____",
            "_1____",
            "_2____",
            "_1____",
            "_2____",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnAllTwosRemaining() {
        let boardString = [
            "______",
            "_1____",
            "______",
            "_1____",
            "______",
            "_1____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnAllOnesRemaining() {
        let boardString = [
            "______",
            "_2____",
            "______",
            "_2____",
            "______",
            "_2____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnBothOnesAndTwosRemains() {
        let boardString = [
            "______",
            "_1____",
            "_2____",
            "_1____",
            "_2____",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnBothOnesAndTwosRemainsMoreOnes() {
        let boardString = [
            "______",
            "_1____",
            "_2____",
            "_1____",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnBothOnesAndTwosRemainsMoreTwos() {
        let boardString = [
            "______",
            "__2___",
            "__1___",
            "__2___",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
    
    func testColumnNoRemainsSplit() {
        let boardString = [
            "__1___",
            "__1___",
            "__1___",
            "__2___",
            "__2___",
            "__2___"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
    func testColumnNoRemainsSpread() {
        let boardString = [
            "_1____",
            "_2____",
            "_1____",
            "_2____",
            "_1____",
            "_2____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: CompleteRowColumn()))
    }
}
