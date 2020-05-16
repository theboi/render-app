//
//  InspectorView.swift
//  Render
//
//  Created by Ryan The on 13/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class InspectorView: NSView {
    
    private lazy var stack = NSStackView(views: [NSView()])
    private lazy var rule = NSPredicateEditor()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addSubview(rule)
        rule.wantsLayer = true
        rule.layer?.backgroundColor = NSColor.red.cgColor
        rule.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self).offset(0)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
