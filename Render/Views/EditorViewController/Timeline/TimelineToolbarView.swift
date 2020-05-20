//
//  TimelineToolbarView.swift
//  Render
//
//  Created by Ryan The on 6/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class TimelineToolbarView: NSView {
    private var frames = 0
    private lazy var timeView = NSTextField(string: String(frames))
    private lazy var recordButton = NSButton(title: "􀀁", target: self, action: #selector(method(for:)))
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        timeView.wantsLayer = true
        addSubview(timeView)
        timeView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self).inset(0)
            make.width.equalTo(100)
            make.centerX.equalTo(self)
        }
        
//        recordButton.attributedTitle = NSAttributedString(string: "􀀁", attributes: [.foregroundColor : NSColor.red])
//        addSubview(recordButton)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
