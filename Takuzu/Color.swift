//
//  Color.swift
//  Takuzu
//
//  Created by Erland Isaksson on 2019-08-14.
//  Copyright © 2019 Erland Isaksson. All rights reserved.
//

import Foundation
import SpriteKit

class Color {
    #if os(iOS)
    static let orange = UIColor.orange
    static let brown = UIColor.brown
    static let clear = UIColor.clear
    static let black = UIColor.black
    #elseif os(OSX)
    static let orange = NSColor.orange
    static let brown = NSColor.brown
    static let clear = NSColor.clear
    static let black = NSColor.black
    #endif
}
