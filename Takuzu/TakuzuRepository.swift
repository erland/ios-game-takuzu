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
        "__2_____2__21___1_________22_21_____",
        "_2__2_1___________1__1_11__1______2_",
        "_________2___1_22___1___________1_11",
        "___2__2_____22______1_1______2___22_",
        "2__2_____22__2___1______22_____2____"
    ]
    let medium : [String] = [
        "_______1__2___1__2___2__2____2___2__1____2__1_1_1_________22_2__",
        "__1_2___1____1___2_1_____22_2________1__1____1____22_____2_____1",
        "1__2___________222__12_______2____1_______1_1_1__2_____2__12____",
        "______1___1________1__22____2____2___1_1__1___22_2______1__22___",
        "____1__________2___2_____11____2_____1____22_1_2____1_________2_",
        "__________1_____2__2_2__________1_1_11__1____22__2_______11_1_1_",
        "___1__2___________21__22____2__2_2___1___1____2____11____2__2___",
        "___1_22___21__________11__22___2_____1___1_11_________2_2_______",
        "_1__________1___11___2____2___11______1_2_2_____2_____2_____2___",
        "__1_1______2_2_________122____2_1____1________2__11_____________",
        "__1__1_1_________________1_1_1__2___11________2_1__2________1___",
        "_________11__2_____2______1____1______2___22__2___2__1_____2__2_"
    ]
    let hard : [String] = [
        "2_1_2__2____1_______1_____22_1____2___22_2____2________1_____22____11_1__2___1____1___2________1____",
        "_21__2____2__2_______1___1_____1___11_____2______21_11______________1_1____2_2___2_2_2_____________1",
        "___2__12_2___2_______2___2____1__2_____1_2_2______2_1__2_________________________2__1_______1____2__",
        "_____2______________22__12_1___1___2_1_2__2________22_____22______2_2__11___2__2__________2_2_2__1__",
        "___1______________11_2__1______2_2_____2_____2__1___2___1_____2___12_________2______1______2___2____",
        "2____22___22__2_______1__2_2_22__2___2____________2___________1___1__________2_2__1__2_______2___2__",
        "_________2______2_2______1___1__2_____1__1___1____2_________2____1__1___11__2____1____2___2__11_____",
        "___11____2_2___________1_________1__1_____________11__________2__2___2___2_2_____11____________22_2_",
        "___1____1________2_2_____1___2_1__2_2_____1_2___1_2____22___1__2____2____11__2_1_2______________1___",
        "___2___2__2___1___1__1____2_____22_____21_______1____2__2_________22_____2_1____1__________2________",
        "__1_____11______2_2____2______1__2___2___2___________________1______1_2___22_______22_______1___1_1_",
        "_____1_21__22___22__1______________1_______1__22_________2____2_____2___________1_________1_2_____1_"
    ]
    let veryHard : [String] = [
        "1_________2_1_____1__1_1____1______1______22__2_______21____22__2______2_____2_2_____1_____2___1__1_",
        "___11_______11_____2__1__2__2______22_2___2______1__________1_11_____________2_____1____1_________1_",
        "_22___1__1____1_1__12______2__2_______1__2_2_____________1_1__11________2__2__2____1__1__1__________",
        "2_____2________________2____________22_2_11__1____2___2__1____1____1_2__________1__2________1_11____",
        "_____1__2__22_2___2______1______2_2_______________22__2_______11_________1__2____________1_1____2_2_",
        "__1____2__2__22___2_2___________________11____2____11_2___2______1_2____1_____2____________________2",
        "2__2_____211_2_1________1________2_______1________2_____1_2___2___1___1________1___22_______________",
        "_______1_12__2___2__22__1__________1______12___2____1__2_____________1__1__1_1____1___________12___2",
        "_____1__1___2___1___1__2__12_2____1__2_2_1_______________11___________2_2____2____________2____1_2__",
        "____2___1___2___22_2__2_1_____________11_____22___2____________1___1____1_2_____2____1__1_2______2__",
        "___1__2______1_1__2_____2____122________________2__2_____1__1________21__2_______2_________11______1",
        "_1__1_1___________2______11__1_______2__11______1__11__2__1_________________________22__1____2___2__"
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
                                                                                                  HiddenTrio(),
                                                                                                  MultipleHiddenTrio()]) {
            return Difficulty.Hard
        }else if TechniqueSolverBoard(boardString: boardNumbers, debug: false).solve(techniques: [Pair(),
                                                                                                  CompleteRowColumn(),
                                                                                                  AvoidTrio(),
                                                                                                  HiddenTrio(),
                                                                                                  MultipleHiddenTrio(),
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
                                                maxNumbers: Int(0.33*Double(size*size)), timeoutSeconds: 120)
        case .Medium:
            return generator.generateWithLimits(tooEasyTechniques: [Pair(),
                                                                      CompleteRowColumn()],
                                                maxTechniques: [Pair(),
                                                             CompleteRowColumn(),
                                                             AvoidTrio()],
                                                maxNumbers: Int(0.28 * Double(size * size)), timeoutSeconds: 120)
        case .Hard:
            return generator.generateWithLimits(tooEasyTechniques: [Pair(),
                                                                    CompleteRowColumn(),
                                                                    AvoidTrio()],
                                                maxTechniques: [Pair(),
                                                             CompleteRowColumn(),
                                                             AvoidTrio(),
                                                             HiddenTrio(),
                                                             MultipleHiddenTrio()],
                                                maxNumbers: Int(0.25*Double(size*size)), timeoutSeconds: 120)
        case .VeryHard:
            return generator.generateWithLimits(tooEasyTechniques: [Pair(),
                                                                    CompleteRowColumn(),
                                                                    AvoidTrio(),
                                                                    HiddenTrio(),
                                                                    MultipleHiddenTrio()],
                                                maxTechniques: [Pair(),
                                                             CompleteRowColumn(),
                                                             AvoidTrio(),
                                                             HiddenTrio(),
                                                             MultipleHiddenTrio(),
                                                             UniqueRowColumn()],
                                                maxNumbers: Int(0.23*Double(size*size)), timeoutSeconds: 120)
        }
    }
}
