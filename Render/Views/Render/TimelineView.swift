//
//  TimelineView.swift
//  Render
//
//  Created by Ryan The on 3/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SnapKit

class TimelineView: NSView {

    private var timelineZoom = 1
    private var timelineView = NSScrollView(frame: NSRect())
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        super.addSubview(timelineView)
        timelineView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(ConstraintInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        timelineView.rulersVisible = true
        timelineView.hasHorizontalRuler = true
        timelineView.hasHorizontalScroller = true
        timelineView.documentView = NSView(frame: NSRect(x: 0, y: 0, width: 2000, height: 1))
        timelineView.magnification = CGFloat(timelineZoom)
    }
    
    
    
}
