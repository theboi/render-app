//
//  Constants.swift
//  Render
//
//  Created by Ryan The on 3/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Foundation
import Cocoa

struct K {
    static let screenRect = NSRect(x: 0, y: 0, width: NSScreen.main?.frame.width ?? 1000, height: NSScreen.main?.frame.height ?? 1000)
    static let screenWidth = NSScreen.main?.frame.width ?? 100
    static let screenHeight = NSScreen.main?.frame.height ?? 100
}
