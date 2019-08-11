//
//  SudokuRepository.swift
//  Sudoku
//
//  Created by Erland Isaksson on 2019-06-16.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation

class TakuzuRepository {
    let easy : [String] = [
        "2_____22_______11_____11_________2__",
        "_______22______11__1__1_________22__",
        "___2_1___2__1____1__22__2______2__1_",
        "_1______2_______11_____1__22_____2_2",
        "1_____11__1____22_1_1______1________",
        "_22____________2_21_11______2_1_____",
        "___11________1______2_221___2___2___",
        "_1___1_1_2__2_______1__12_______2___",
        "__2_____2__21___1_________22_21_____",
        "2__2____1_1______2___2_2__1_______1_",
        "_2__2_1___________1__1_11__1______2_",
        "___1___2___2____1__11_1________2__2_"
    ]
    let medium : [String] = [
        "_1___211__2_____2_1_1____________2__",
        "2_1____1_2_1__2____11________1___2__",
        "__2__21__1_1_2_______1___________1__",
        "_2____1____1___2_____2__2_2_2___1_2_",
        "__2______1__22_1_________22___22____",
        "__1__12___1__1____2_22________2_____",
        "___1___22________11__22_____2_______",
        "__2_2__12___2___2__1________22_1____",
        "_______1_1___11_____1_2_2_____2_____",
        "_2___1_1_1__2____________2__22__1___",
        "_________2__2__22_____2__1___12_____",
        "1__11_1_11___________1_12___________"
    ]
    let hard : [String] = [
        "___11______1_2__2_22_______1___1____",
        "1_______2_22________22_______1___11_",
        "___2____22______1_______1______1__2_",
        "__22_2__2__2_____________22_______1_",
        "1__2__1______________2___2__22___22_",
        "_________11_22_____2_2_______1__1___",
        "__2__2____22_2_1__2____2____________",
        "12_______1_______2____22__1___1_____",
        "1________________21___1___2_____22_2",
        "__1_1__2________11____1_22____2_____",
        "______2___1_____1______211_____11___",
        "_11___1_____1_1_2__2_______2________"
    ]
    let veryHard : [String] = [
        "__11_1_2__2___1_____2____1__________",
        "__1_______1_11_2_________1___2_____2",
        "____1_____11___2__________1_11______",
        "_11__________11___11_______2_______2",
        "_1_2___1______11___1____2_____2_____",
        "___1____2_2__2___2_2_______1_1______",
        "___11_____1______2____2__2___1_2____",
        "_2________2___21_1_____1___2_______1",
        "___11_______22_____1________112_____",
        "__2__2____11______22_2_________1____",
        "__1__1__1______2_2___2___2_______2__",
        "__1_2_22____2________1____2_________"
    ]

    func validateBoards() {
        var success = true
        for difficulty in [Difficulty.Easy, Difficulty.Medium, Difficulty.Hard, Difficulty.VeryHard] {
            var level = 1
            var board = getBoard(difficulty: difficulty, level: level)
            while board != nil {
                let solver = BruteForceSolverBoard.init(boardString: board!)
                if !solver.solve() {
                    success = false
                    print("Failed to solve \(difficulty) \(level)")
                    solver.printBoard()
                }else {
                    print("Successfully validated \(difficulty) \(level)")
                    //print("\(difficulty) \(level) estimated as: \(calculateDifficulty(boardNumbers: board!))")
                }
                level = level + 1
                board = getBoard(difficulty: difficulty, level: level)
            }
        }
        if success {
            print("Successfully validated all boards")
        }
    }
    func getBoard(difficulty: Difficulty, level: Int) -> String? {
        var levelNo = level
        if level < 1 {
            return nil
        }
        levelNo = level - 1

        switch difficulty {
        case .Easy:
            if levelNo<easy.count {
                return easy[levelNo]
            }
        case .Medium:
            if levelNo<medium.count {
                return medium[levelNo]
            }
        case .Hard:
            if levelNo<hard.count {
                return hard[levelNo]
            }
        case .VeryHard:
            if levelNo<veryHard.count {
                return veryHard[levelNo]
            }
        }
        return nil
    }
    
    func calculateDifficulty(boardNumbers: String) -> Difficulty {
        if TechniqueSolverBoard(boardString: boardNumbers, debug: false).solve(techniques: [Pair(),CompleteRowColumn()]) {
            return Difficulty.Easy
        }else if TechniqueSolverBoard(boardString: boardNumbers, debug: false).solve(techniques: [Pair(),
                                                                                                  CompleteRowColumn(),
                                                                                                  AvoidTrio()]) {
            return Difficulty.Medium
        }else if TechniqueSolverBoard(boardString: boardNumbers, debug: false).solve(techniques: [Pair(),
                                                                                                  CompleteRowColumn(),
                                                                                                  AvoidTrio(),
                                                                                                  HiddenTrio()]) {
            return Difficulty.Hard
        }else if TechniqueSolverBoard(boardString: boardNumbers, debug: false).solve(techniques: [Pair(),
                                                                                                  CompleteRowColumn(),
                                                                                                  AvoidTrio(),
                                                                                                  HiddenTrio(),
                                                                                                  UniqueRowColumn()]) {
            return Difficulty.VeryHard
        }else {
            print("Unable to solve board with implemented techniques")
            return Difficulty.VeryHard
        }
    }
    
    func getGeneratedBoard(size: Int) -> String? {
        let generator = BoardGenerator(size: size)
        return generator.generateWithLimits(maxTechniques: [Pair(),
                                                            CompleteRowColumn(),
                                                            AvoidTrio(),
                                                            HiddenTrio(),
                                                            UniqueRowColumn()],
                                            maxNumbers: 11, timeoutSeconds: 120)
    }
    

    func getGeneratedBoard(difficulty: Difficulty, size: Int) -> String? {
        let generator = BoardGenerator(size: size)
        switch difficulty {
        case .Easy:
            return generator.generateWithLimits(maxTechniques: [Pair(),
                                                             CompleteRowColumn()],
                                                maxNumbers: 12, timeoutSeconds: 120)
        case .Medium:
            return generator.generateWithLimits(tooEasyTechniques: [Pair(),
                                                                      CompleteRowColumn()],
                                                maxTechniques: [Pair(),
                                                             CompleteRowColumn(),
                                                             AvoidTrio()],
                                                maxNumbers: 10, timeoutSeconds: 120)
        case .Hard:
            return generator.generateWithLimits(tooEasyTechniques: [Pair(),
                                                                    CompleteRowColumn(),
                                                                    AvoidTrio()],
                                                maxTechniques: [Pair(),
                                                             CompleteRowColumn(),
                                                             AvoidTrio(),
                                                             HiddenTrio()],
                                                maxNumbers: 9, timeoutSeconds: 120)
        case .VeryHard:
            return generator.generateWithLimits(tooEasyTechniques: [Pair(),
                                                                    CompleteRowColumn(),
                                                                    AvoidTrio(),
                                                                    HiddenTrio()],
                                                maxTechniques: [Pair(),
                                                             CompleteRowColumn(),
                                                             AvoidTrio(),
                                                             HiddenTrio(),
                                                             UniqueRowColumn()],
                                                maxNumbers: 8, timeoutSeconds: 120)
        }
    }
}
