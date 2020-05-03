//
//  RenderViewController.swift
//  Render
//
//  Created by Ryan The on 2/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class RenderViewController: NSViewController {
    
    private var rootSplitView = NSSplitView(frame: K.screenRect)
    private var rootSplitViewLeft = NSView(frame: NSRect())
    private var rootSplitViewCenter = NSView(frame: NSRect())
    private var rootSplitViewRight = NSView(frame: NSRect())


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
        rootSplitView.isVertical = true
        rootSplitViewLeft.wantsLayer = true
        rootSplitViewLeft.layer?.backgroundColor = NSColor.red.cgColor
        view.addSubview(rootSplitView)
        rootSplitView.dividerStyle = .thin
        rootSplitView.subviews = [rootSplitViewLeft, rootSplitViewCenter, rootSplitViewRight]
        
        
    }
    
    override func loadView() {
        self.view = NSView(frame: K.screenRect)
    }
}
