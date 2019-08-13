//
//  UniqueRowColumnTests.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-12.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import XCTest
@testable import Takuzu

class UniqueRowColumnTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRowFullAboveTwoEmptyToLeft() {
        let boardString = [
            "______",
            "121212",
            "__1212",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }

    func testRowFullAboveTwoEmptyToRight() {
        let boardString = [
            "______",
            "121212",
            "1212__",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }

    func testRowFullAboveTwoEmptyInMiddle() {
        let boardString = [
            "______",
            "121212",
            "12__12",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }

    func testRowFullAboveTwoEmptySpread() {
        let boardString = [
            "______",
            "212121",
            "21_12_",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    

    func testRowFullBelowTwoEmptyToLeft() {
        let boardString = [
            "______",
            "__2121",
            "______",
            "212121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testRowFullBelowTwoEmptyToRight() {
        let boardString = [
            "______",
            "2121__",
            "______",
            "212121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testRowFullBelowTwoEmptyInMiddle() {
        let boardString = [
            "______",
            "21__21",
            "______",
            "212121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }

    func testRowFullBelowTwoEmptySpread() {
        let boardString = [
            "______",
            "21_12_",
            "______",
            "212121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }

    func testRowNegativeFullBelowThreeEmptyLeft() {
        let boardString = [
            "______",
            "___121",
            "______",
            "212121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }

    func testRowNegativeFullBelowThreeEmptyRight() {
        let boardString = [
            "______",
            "212___",
            "______",
            "212121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }

    func testRowNegativeFullBelowThreeEmptySpread() {
        let boardString = [
            "______",
            "2_2_2_",
            "______",
            "212121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }

    func testRowOneEmptyWhereEmpty() {
        let boardString = [
            "______",
            "212__1",
            "______",
            "2121_1",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }

    func testRowNegativeOneEmptyWhereNotEmpty() {
        let boardString = [
            "______",
            "212__1",
            "______",
            "_12121",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }
    func testRowOtherRowInbetweenOneEMptyWhereEmpty() {
        let boardString = [
            "______",
            "212__1",
            "121212",
            "2121_1",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testRowOtherRowAboveOneEMptyWhereEmpty() {
        let boardString = [
            "______",
            "121212",
            "212__1",
            "2121_1",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnFullOnLeftTwoEmptyAtTop() {
        let boardString = [
            "_1____",
            "_2____",
            "_11___",
            "_22___",
            "_11___",
            "_22___"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnFullOnLeftTwoEmptyAtBottom() {
        let boardString = [
            "_11___",
            "_22___",
            "_11___",
            "_22___",
            "_1____",
            "_2____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnFullOnLeftTwoEmptyInMiddle() {
        let boardString = [
            "_11___",
            "_22___",
            "_1____",
            "_2____",
            "_11___",
            "_22___"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnFullOnLeftTwoEmptySpread() {
        let boardString = [
            "_22___",
            "_11___",
            "_2____",
            "_11___",
            "_22___",
            "_1____"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    
    func testColumnFullOnRightTwoEmptyAtTop() {
        let boardString = [
            "___2__",
            "___1__",
            "_2_2__",
            "_1_1__",
            "_2_2__",
            "_1_1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnFullOnRightTwoEmptyAtBottom() {
        let boardString = [
            "_2_2__",
            "_1_1__",
            "_2_2__",
            "_1_1__",
            "___2__",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnFullOnRightTwoEmptyInMiddle() {
        let boardString = [
            "_2_2__",
            "_1_1__",
            "___2__",
            "___1__",
            "_2_2__",
            "_1_1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnFullOnRightTwoEmptySpread() {
        let boardString = [
            "_2_2__",
            "_1_1__",
            "___2__",
            "_1_1__",
            "_2_2__",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnNegativeFullOnRightThreeEmptyAtTop() {
        let boardString = [
            "___2__",
            "___1__",
            "___2__",
            "_1_1__",
            "_2_2__",
            "_1_1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnNegativeFullOnRightThreeEmptyAtBottom() {
        let boardString = [
            "_2_2__",
            "_1_1__",
            "_2_2__",
            "___1__",
            "___2__",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnNegativeFullOnRightThreeEmptySpread() {
        let boardString = [
            "____1_",
            "__2_2_",
            "____1_",
            "__2_2_",
            "____1_",
            "__2_2_"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnOneEmptyWhereEmpty() {
        let boardString = [
            "__2_2_",
            "__1_1_",
            "__2_2_",
            "____1_",
            "______",
            "__1_1_"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnNegativeOneEmptyWhereNotEmpty() {
        let boardString = [
            "__2___",
            "__1_1_",
            "__2_2_",
            "____1_",
            "____2_",
            "__1_1_"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: UniqueRowColumn()))
    }
    func testColumnOtherRowInbetweenOneEmptyWhereEmpty() {
        let boardString = [
            "__212_",
            "__121_",
            "__212_",
            "___21_",
            "___1__",
            "__121_"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
    
    func testColumnOtherRowOnLeftOneEMptyWhereEmpty() {
        let boardString = [
            "_12_2_",
            "_21_1_",
            "_12_2_",
            "_2__1_",
            "_1____",
            "_21_1_"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: UniqueRowColumn()))
    }
}
