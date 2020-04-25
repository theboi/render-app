//
//  WindowController.swift
//  Render
//
//  Created by Ryan The on 25/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        if (contentViewController?.className)! == "Render.RenderVC" {
            if let window = window, let screen = window.screen {
                window.setFrameOrigin(NSPoint(x: 0, y: 0))
                window.setContentSize(NSSize(width: screen.frame.width, height: screen.frame.height))
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }
}
