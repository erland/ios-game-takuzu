//
//  HiddenTrioTests.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-12.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import XCTest
@testable import Takuzu

class HiddenTrioTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRowLeftMoreTwos() {
        let boardString = [
            "______",
            "___122",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testRowLeftMoreOnes() {
        let boardString = [
            "______",
            "___211",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }

    func testRowRightMoreTwos() {
        let boardString = [
            "______",
            "221___",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testRowRightMoreOnes() {
        let boardString = [
            "______",
            "112___",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }

    func testRowMiddleMoreTwos() {
        let boardString = [
            "______",
            "21___2",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testRowMiddleMoreOnes() {
        let boardString = [
            "______",
            "12___1",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }

    func testRowNegativeMiddleMoreTwosSafeBothSides() {
        let boardString = [
            "______",
            "12___2",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testRowNegativeMiddleMoreOnesSafeBothSides() {
        let boardString = [
            "______",
            "21___1",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    

    func testRowMiddleMoreTwosOpenOnRightSide() {
        let boardString = [
            "______",
            "21__2_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testRowMiddleMoreOnesOpenOnRightSide() {
        let boardString = [
            "______",
            "12__1_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testRowMiddleMoreTwosOpenOnLeftSide() {
        let boardString = [
            "______",
            "_2__12",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testRowMiddleMoreOnesOpenOnLeftSide() {
        let boardString = [
            "______",
            "_1__21",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }

    func testRowNegativeLeftMoreTwos() {
        let boardString = [
            "______",
            "___212",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testRowNegativeLeftMoreOnes() {
        let boardString = [
            "______",
            "___121",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testRowNegativeRightMoreTwos() {
        let boardString = [
            "______",
            "212___",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testRowNegativeRightMoreOnes() {
        let boardString = [
            "______",
            "121___",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testRowNegativeMiddleMoreTwosOpenOnRightSide() {
        let boardString = [
            "______",
            "12__2_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testRowNegativeMiddleMoreOnesOpenOnRightSide() {
        let boardString = [
            "______",
            "21__1_",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testRowNegativeMiddleMoreTwosOpenOnLeftSide() {
        let boardString = [
            "______",
            "_2__21",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testRowNegativeMiddleMoreOnesOpenOnLeftSide() {
        let boardString = [
            "______",
            "_1__12",
            "______",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    // Vertical
    
    func testColumnTopMoreTwos() {
        let boardString = [
            "______",
            "______",
            "______",
            "___1__",
            "___2__",
            "___2__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnTopMoreOnes() {
        let boardString = [
            "______",
            "______",
            "______",
            "___2__",
            "___1__",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnBottomMoreTwos() {
        let boardString = [
            "___2__",
            "___2__",
            "___1__",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnBottomMoreOnes() {
        let boardString = [
            "___1__",
            "___1__",
            "___2__",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnMiddleMoreTwos() {
        let boardString = [
            "___2__",
            "___1__",
            "______",
            "______",
            "______",
            "___2__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testColumnMiddleMoreOnes() {
        let boardString = [
            "___1__",
            "___2__",
            "______",
            "______",
            "______",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnNegativeMiddleMoreTwosSafeBothSides() {
        let boardString = [
            "___1__",
            "___2__",
            "______",
            "______",
            "______",
            "___2__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testColumnNegativeMiddleMoreOnesSafeBothSides() {
        let boardString = [
            "___2__",
            "___1__",
            "______",
            "______",
            "______",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    
    func testColumnMiddleMoreTwosOpenOnBottomSide() {
        let boardString = [
            "___2__",
            "___1__",
            "______",
            "______",
            "___2__",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testColumnMiddleMoreOnesOpenOnBottomSide() {
        let boardString = [
            "___1__",
            "___2__",
            "______",
            "______",
            "___1__",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testColumnMiddleMoreTwosOpenOnTopSide() {
        let boardString = [
            "______",
            "___2__",
            "______",
            "______",
            "___1__",
            "___2__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testColumnMiddleMoreOnesOpenOnTopSide() {
        let boardString = [
            "______",
            "___1__",
            "______",
            "______",
            "___2__",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnNegativeTopMoreTwos() {
        let boardString = [
            "______",
            "______",
            "______",
            "___2__",
            "___1__",
            "___2__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnNegativeTopMoreOnes() {
        let boardString = [
            "______",
            "______",
            "______",
            "___1__",
            "___2__",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnNegativeBottomMoreTwos() {
        let boardString = [
            "___2__",
            "___1__",
            "___2__",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnNegativeBottomMoreOnes() {
        let boardString = [
            "___1__",
            "___2__",
            "___1__",
            "______",
            "______",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    
    func testColumnNegativeMiddleMoreTwosOpenOnBottomSide() {
        let boardString = [
            "___1__",
            "___2__",
            "______",
            "______",
            "___2__",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testColumnNegativeMiddleMoreOnesOpenOnBottomSide() {
        let boardString = [
            "___2__",
            "___1__",
            "______",
            "______",
            "___1__",
            "______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testColumnNegativeMiddleMoreTwosOpenOnTopSide() {
        let boardString = [
            "______",
            "___2__",
            "______",
            "______",
            "___2__",
            "___1__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testColumnNegativeMiddleMoreOnesOpenOnTopSide() {
        let boardString = [
            "______",
            "___1__",
            "______",
            "______",
            "___1__",
            "___2__"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(!solver.solve(technique: HiddenTrio()))
    }
    func testRow10WithRightTrio() {
        let boardString = [
            "__________",
            "1_21121___",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testRow10WithRightNearbyDanger() {
        let boardString = [
            "__________",
            "2112112___",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        let observer = SolverVerifier(size: 10)
        solver.attachObserver(observer)
        XCTAssert(solver.solve(technique: HiddenTrio()))
        XCTAssert(observer[9,1]==2)
    }

    func testRow10WithLeftNearbyDanger() {
        let boardString = [
            "__________",
            "___2112112",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        let observer = SolverVerifier(size: 10)
        solver.attachObserver(observer)
        XCTAssert(solver.solve(technique: HiddenTrio()))
        XCTAssert(observer[0,1]==2)
    }

    func testRow10WithMiddleNearbyDanger() {
        let boardString = [
            "__________",
            "211___2112",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        let observer = SolverVerifier(size: 10)
        solver.attachObserver(observer)
        XCTAssert(solver.solve(technique: HiddenTrio()))
        XCTAssert(observer[3,1]==2)
    }
    
    func testRow10WithMiddleTrio() {
        let boardString = [
            "__________",
            "1_211___12",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testRow10WithLeftTrio() {
        let boardString = [
            "__________",
            "___12112_1",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }

    func testColumn10WithBottomTrio() {
        let boardString = [
            "_1________",
            "__________",
            "_2________",
            "_1________",
            "_1________",
            "_2________",
            "_1________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumn10WithMiddleTrio() {
        let boardString = [
            "_1________",
            "__________",
            "_2________",
            "_1________",
            "_1________",
            "__________",
            "__________",
            "__________",
            "_1________",
            "_2________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    func testColumn10WithTopTrio() {
        let boardString = [
            "__________",
            "__________",
            "__________",
            "_1________",
            "_2________",
            "_1________",
            "_1________",
            "_2________",
            "__________",
            "_1________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: HiddenTrio()))
    }
    
    func testColumn10WithBottomNearbyDanger() {
        let boardString = [
            "_2________",
            "_1________",
            "_1________",
            "_2________",
            "_1________",
            "_1________",
            "_2________",
            "__________",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        let observer = SolverVerifier(size: 10)
        solver.attachObserver(observer)
        XCTAssert(solver.solve(technique: HiddenTrio()))
        XCTAssert(observer[1,9]==2)
    }

    func testColumn10WithTopNearbyDanger() {
        let boardString = [
            "__________",
            "__________",
            "__________",
            "__2_______",
            "__1_______",
            "__1_______",
            "__2_______",
            "__1_______",
            "__1_______",
            "__2_______"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        let observer = SolverVerifier(size: 10)
        solver.attachObserver(observer)
        XCTAssert(solver.solve(technique: HiddenTrio()))
        XCTAssert(observer[2,0]==2)
    }
    

    func testColumn10WithMiddleNearbyDanger() {
        let boardString = [
            "_2________",
            "_1________",
            "_1________",
            "__________",
            "__________",
            "__________",
            "_2________",
            "_1________",
            "_1________",
            "_2________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        let observer = SolverVerifier(size: 10)
        solver.attachObserver(observer)
        XCTAssert(solver.solve(technique: HiddenTrio()))
        XCTAssert(observer[1,3]==2)
    }
    

}
