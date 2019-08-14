//
//  NumberView.swift
//  Sudoku
//
//  Created by Erland Isaksson on 2019-06-14.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import SpriteKit

class NumberView : SKSpriteNode, NumberObserver {
    let cellSize: CGFloat
    let number : Number
    
    init(number: Number, cellSize: CGFloat) {
        self.cellSize = cellSize
        self.number = number
        super.init(texture: nil, color: Color.clear, size: CGSize(width: cellSize, height: cellSize))
        setScale(cellSize/66.67)
        number.attachObserver(observer: self)
        anchorPoint = CGPoint(x: 0, y: 1)
        numberUpdated(number: number)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberUpdated(number: Number) {
        let positionX = CGFloat(number.x)*cellSize+cellSize/2.0
        let positionY = -CGFloat(number.y)*cellSize-cellSize/2.0
        self.position = CGPoint(x: positionX, y: positionY)
        self.alpha = 1
        removeAllChildren()
        if let n = number.number {
            var fontName = "Chalkduster"
            if number.permanent {
                fontName = "ArialRoundedMTBold"
            }
            let label = SKLabelNode(fontNamed: fontName)
            label.name = "number"
            label.text = "\(n)"
            label.fontSize = 60
            label.horizontalAlignmentMode = .center
            label.verticalAlignmentMode = .center
            label.position = CGPoint(x: 0, y: 0)
            label.fontColor = Color.black
            addChild(label)
        }
    }
    
    
}

