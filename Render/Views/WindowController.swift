//
//  WindowController.swift
//  Render
//
//  Created by Ryan The on 25/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    @IBOutlet var recordSymbol: NSButtonCell!
    override func windowDidLoad() {
        super.windowDidLoad()
        recordSymbol.attributedTitle = NSAttributedString(string: "􀀁", attributes: [NSAttributedString.Key.foregroundColor : NSColor.red])
        
        if (contentViewController?.className)! == "Render.RenderVC" {
            if let window = window, let screen = window.screen {
                window.setFrameOrigin(NSPoint(x: 0, y: 0))
                window.setContentSize(NSSize(width: screen.frame.width, height: screen.frame.height))
            }
        }
    }
    
    override init(window: NSWindow?) {
        super.init(window: window)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }
}
