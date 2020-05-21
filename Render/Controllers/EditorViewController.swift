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
    
    private lazy var rootSplitView = NSSplitView()
    private lazy var rootSplitViewLeft = NSView()
    
    private lazy var mixerSplitView = NSSplitView()
    private lazy var mixerBottomView = MixerView()
    private lazy var mixerTopView = InspectorView()
    
    private lazy var centerSplitView = NSSplitView()
    private lazy var sceneView = SceneView()
    private lazy var timelineView = TimelineView()
    
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
        self.view = NSView(frame: K.screenRect)
    }

    func splitViewDidResizeSubviews(_ notification: Notification) {
        mixerSplitView.setPosition(mixerSplitView.frame.height - timelineView.frame.height - 1, ofDividerAt: 0)
    }
}


