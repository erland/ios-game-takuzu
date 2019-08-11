//
//  SingleGameScene.swift
//  Sudoku
//
//  Created by Erland Isaksson on 2019-06-14.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import SpriteKit
import GameplayKit

class SingleGameScene: SKScene, BoardObserver, SolverObserver {
    var gameDelegate: GameDelegate?
    var boardView : BoardView?
    var eraseButton : SKLabelNode?
    var clearButton : SKLabelNode?
    var selectedPos : IntPosition?
    var showHintButton : SKLabelNode?
    var quitButton : SKLabelNode?
    var hintName : SKLabelNode?
    var timeText : SKLabelNode?
    var recordLabel : SKLabelNode?
    var recordTime : SKLabelNode?
    var boardName : SKLabelNode?
    var invalidBoard : SKLabelNode?
    var timeCounter : Int = 0
    var record : Int?
    var hints = 0

    override func sceneDidLoad() {
        localize()
    }
    
    func setup(delegate: GameDelegate, board: Board, startTime: Int) {
        self.gameDelegate = delegate
        
        self.boardView = childNode(withName: "board") as? BoardView
        self.eraseButton = childNode(withName: "erase") as? SKLabelNode
        self.quitButton = childNode(withName: "quit") as? SKLabelNode
        self.clearButton = childNode(withName: "clear") as? SKLabelNode
        self.boardName = childNode(withName: "boardName") as? SKLabelNode
        self.invalidBoard = childNode(withName: "invalidBoard") as? SKLabelNode
        self.invalidBoard?.isHidden = true
        self.boardName?.text = board.name
        self.showHintButton = childNode(withName: "showHint") as? SKLabelNode
        self.hintName = childNode(withName: "hintName") as? SKLabelNode
        self.hintName?.isHidden = true
        print("Setup board view for \(board.name)")
        self.boardView?.setup(board: board)
        self.timeText = childNode(withName: "time") as? SKLabelNode
        self.recordLabel = childNode(withName: "record") as? SKLabelNode
        self.recordTime = childNode(withName: "recordTime") as? SKLabelNode
        record = BoardStorage().getRecord(board: board)
        if record != nil {
            recordTime?.text = timeAsString(record!)
        }else {
            recordLabel?.isHidden = true
            recordTime?.isHidden = true
        }
        timeCounter = startTime
        displayTime()

        
        boardView?.board?.attachObserver(self)
    }
    deinit {
        boardView?.board?.detachObserver(self)
    }
    
    override func didMove(to view: SKView) {
        print("Moved to game scene")
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        timeCounter = timeCounter + 1
        displayTime()
    }
    
    func timeAsString(_ seconds: Int) -> String {
        let hours = Int(seconds/3600)
        let minutes = String(format: "%02d",Int((seconds%3600)/60))
        let seconds = String(format: "%02d",Int(seconds%60))
        if hours == 0 {
            return  "\(minutes):\(seconds)"
        }else {
            return "\(hours):\(minutes):\(seconds)"
        }
    }

    func displayTime() {
        if record != nil && timeCounter>record! {
            timeText?.fontColor = .red
        }
        timeText?.text = "\(timeAsString(timeCounter))"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        placeNumber(position: touchLocation)
    }
    
    func placeNumber(position: CGPoint) {
        boardView?.clearSolverCells()
        hintName?.isHidden = true
        if boardView!.contains(position) {
            if let cellPos = boardView?.cellForLocation(position: position) {
                if let number = boardView?.board?.atPosition(cellPos.x, cellPos.y) {
                    if number.number != nil && number.final {
                        if number.number == 1 {
                            number.number = 2
                            number.error = !(boardView!.board!.isValidBoard(number: number))
                        }else {
                            boardView?.board?.removeNumber(x: cellPos.x, y: cellPos.y)
                        }
                    }else {
                        // Do nothing if a permanent number
                    }
                }else {
                    boardView?.board?.addFinalNumber(number: 1, x: cellPos.x, y: cellPos.y)
                }
            }
        }else if quitButton!.contains(position) {
            gameDelegate?.gameComplete(playerName: boardView!.board!.name, board: boardView!.board!, seconds: timeCounter, hints: hints)
        }else if clearButton!.contains(position) {
            clearBoard()
        }else if showHintButton!.contains(position) {
            showHint()
        }
        checkAndProcessGameEnding()
    }
    func clearBoard() {
        for y in 0..<9 {
            for x in 0..<9 {
                let number = boardView!.board!.atPosition(x, y)
                if number != nil && !(number!.permanent) {
                    boardView!.board!.removeNumber(x: x, y: y)
                }
            }
        }
    }

    func showHint() {
        boardView?.clearSolverCells()
        let boardString = boardView!.board!.asString()
        let solver = TechniqueSolverBoard(boardString: boardString, debug: false)
        solver.attachObserver(self)
        hints = hints + 1
        hintName?.isHidden = false
        hintName?.fontColor = UIColor.green
        if solver.solve(technique: Pair()) {
            print("Showed solution with Single Candidate")
            hintName?.text = NSLocalizedString("hintPair", comment: "hintPair")
        }else if solver.solve(technique: CompleteRowColumn()) {
            print("Showed solution with Single Position")
            hintName?.text = NSLocalizedString("hintCompleteRowColumn", comment: "hintCompleteRowColumn")
        }else if solver.solve(technique: AvoidTrio()) {
            print("Showed solution with Candidate Lines")
            hintName?.text = NSLocalizedString("hintAvoidTrio", comment: "hintAvoidTrio")
        }else if solver.solve(technique: HiddenTrio()) {
            print("Showed solution with Multiple Lines")
            hintName?.text = NSLocalizedString("hintHiddenTrio", comment: "hintHiddenTrio")
        }else if solver.solve(technique: UniqueRowColumn()) {
            print("Showed solution with Naked Pair")
            hintName?.text = NSLocalizedString("hintUniqueRowColumn", comment: "hintUniqueRowColumn")
        }else {
            hints = hints - 1
            hintName?.fontColor = UIColor.orange
            hintName?.text = NSLocalizedString("noHintAvailable", comment: "noHintAvailable")
        }
    }
    
    func solverRemovedCandidate(x: Int, y: Int, value: Int) {
        boardView?.addSolverCellCandidate(x: x, y: y)
    }
    
    func solverSetValue(x: Int, y: Int, value: Int) {
        boardView?.addSolverCellValue(x: x, y: y)
    }
    

    func checkAndProcessGameEnding() {
        if boardView!.board!.isAllNumbersPlaced() {
            var valid = true
            for y in 0..<boardView!.board!.height {
                for x in 0..<boardView!.board!.width {
                    if !boardView!.board!.isValidBoard(number: boardView!.board!.atPosition(x, y)!) {
                        valid = false
                    }
                }
            }
            if valid {
                gameDelegate?.gameComplete(playerName: boardView!.board!.name, board: boardView!.board!, seconds: timeCounter, hints: hints)
            }else {
                invalidBoard?.isHidden = false
            }
        }else {
            invalidBoard?.isHidden = true
        }
        
    }
    
    func numberAdded(number: Number) {
        // TODO: Calculate game over
    }
    func numberRemoved(number: Number) {
        // TODO: Nothing ?
    }

}
