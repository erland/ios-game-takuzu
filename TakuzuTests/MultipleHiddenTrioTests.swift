//
//  MultipleHiddenTrioTests.swift
//  TakuzuTests
//
//  Created by Erland Isaksson on 2019-08-13.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import XCTest
@testable import Takuzu

class MultipleHiddenTrioTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testColumnWithMoreTwos() {
        let boardString = [
            "___2______",
            "___2______",
            "___1______",
            "__________",
            "__________",
            "___2______",
            "__________",
            "___1______",
            "__________",
            "__________"
        ]
        let solver = TechniqueSolverBoard(boardString: boardString.joined(), debug: false)
        XCTAssert(solver.solve(technique: MultipleHiddenTrio()))
    }

}
