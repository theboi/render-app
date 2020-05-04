//
//  RenderViewController.swift
//  Render
//
//  Created by Ryan The on 2/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SnapKit

class RenderViewController: NSViewController {
    
    private var rootSplitView = NSSplitView(frame: NSRect())
    private var rootSplitViewLeft = NSView(frame: NSRect())
    private var rootSplitViewCenter = NSSplitView(frame: NSRect())
    private var rootSplitViewRight = NSView(frame: NSRect())
    
    private var centerSplitViewTop = SceneView()
    private var centerSplitViewBottom = TimelineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rootSplitView)
        
        rootSplitView.snp.makeConstraints { (make) in make.edges.equalTo(view).inset(ConstraintInsets(top: 0, left: 0, bottom: 0, right: 0))}
        rootSplitViewLeft.snp.makeConstraints { (make) in make.width.lessThanOrEqualTo(300)}
        rootSplitViewRight.snp.makeConstraints { (make) in make.width.lessThanOrEqualTo(300)}
        rootSplitView.isVertical = true
        rootSplitView.dividerStyle = .thin
        rootSplitView.subviews = [rootSplitViewLeft, rootSplitViewCenter, rootSplitViewRight]
        
        centerSplitViewBottom.snp.makeConstraints { (make) in make.height.lessThanOrEqualTo(300)}
        rootSplitViewCenter.dividerStyle = .thin
        rootSplitViewCenter.subviews = [centerSplitViewTop, centerSplitViewBottom]
    }
    
    override func viewDidAppear() {
        rootSplitView.setPosition(250, ofDividerAt: 0)
        rootSplitView.setPosition(K.screenWidth - 250, ofDividerAt: 1)
        rootSplitViewCenter.setPosition(K.screenHeight - 250, ofDividerAt: 0)
    }
    
    override func loadView() {
        self.view = NSView(frame: K.screenRect)
    }
}
