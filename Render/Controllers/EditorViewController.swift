//
//  RenderViewController.swift
//  Render
//
//  Created by Ryan The on 2/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SnapKit

class EditorViewController: NSViewController, NSSplitViewDelegate, MixerViewDelegate {
    
    func didSelectSlider(index: Int) {
        mixerTopView.setSliderValues(index: index)
    }
    
    lazy var rootSplitView = NSSplitView()
    lazy var rootSplitViewLeft = NSView()
    
    lazy var mixerSplitView = NSSplitView()
    lazy var mixerBottomView = MixerView()
    lazy var mixerTopView = InspectorView()
    
    lazy var centerSplitView = NSSplitView()
    lazy var sceneView = SceneView()
    lazy var timelineView = TimelineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.subviews = [rootSplitView]
        
        mixerBottomView.delegate = self
        
        rootSplitView.isVertical = true
        rootSplitView.dividerStyle = .thin
        rootSplitView.snp.makeConstraints { (make) in make.edges.equalTo(view).offset(0)}
        rootSplitViewLeft.snp.makeConstraints { (make) in make.width.lessThanOrEqualTo(300)}
        mixerSplitView.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(500)
            make.width.greaterThanOrEqualTo(170)
        }
        rootSplitView.subviews = [rootSplitViewLeft, centerSplitView, mixerSplitView]
        
        centerSplitView.subviews = [sceneView, timelineView]
        centerSplitView.dividerStyle = .thin
        centerSplitView.delegate = self
        timelineView.snp.makeConstraints { (make) in make.height.lessThanOrEqualTo(500)}
        
        mixerSplitView.subviews = [mixerTopView, mixerBottomView]
        mixerSplitView.dividerStyle = .thin
        mixerBottomView.snp.makeConstraints { (make) in make.height.lessThanOrEqualTo(500)}
    }
    
    override func viewDidAppear() {
        rootSplitView.setPosition(250, ofDividerAt: 0)
        rootSplitView.setPosition(K.screenWidth - 250, ofDividerAt: 1)
        centerSplitView.setPosition(K.screenHeight - 350, ofDividerAt: 0)
        mixerSplitView.setPosition(K.screenHeight - 350, ofDividerAt: 0)
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(origin: CGPoint(x: 0, y: 0), size: K.screenSize))
    }
    
    func splitViewDidResizeSubviews(_ notification: Notification) {
        mixerSplitView.setPosition(mixerSplitView.frame.height - timelineView.frame.height - 1, ofDividerAt: 0)
    }
}


