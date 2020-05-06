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
    private lazy var timelineView = NSScrollView(frame: NSRect())
    private lazy var timelineRuler = NSRulerView()
    private lazy var timelineDocument = NSView(frame: NSRect(x: 0, y: 0, width: 2000, height: 1))
    private lazy var zoomRecog = NSMagnificationGestureRecognizer(target: self, action: #selector(onZoom(sender:)))
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addSubview(timelineView)
        self.addGestureRecognizer(zoomRecog)
        timelineView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(ConstraintInsets(top: 50, left: 0, bottom: 0, right: 0))
        }
        
        NSRulerView.registerUnit(withName: NSRulerView.UnitName(rawValue: "Seconds"), abbreviation: "s", unitToPointsConversionFactor: 100, stepUpCycle: [2.0], stepDownCycle: [0.5])
        timelineRuler.measurementUnits = .init("Seconds")
        
        timelineRuler.clientView = timelineDocument
        timelineView.rulersVisible = true
        timelineView.horizontalRulerView = timelineRuler
        timelineView.documentView = timelineDocument
        timelineView.magnification = CGFloat(timelineZoom)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onZoom(sender: NSMagnificationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            if sender.magnification > 0 {
                timelineView.magnification += 0.1
            } else {
                timelineView.magnification -= 0.1
            }
        }
    }
}
