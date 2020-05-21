//
//  MixerToolbarView.swift
//  Render
//
//  Created by Ryan The on 18/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class MixerToolbarView: NSView {

    private lazy var adjustCountButton = NSSegmentedControl(labels: ["􀅼", "􀅽"], trackingMode: .momentary, target: self, action: #selector(onAdjustCountButtonPressed(sender:)))
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addSubview(adjustCountButton)
        
        adjustCountButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func onAdjustCountButtonPressed(sender: NSSegmentedControl) {
        switch sender.indexOfSelectedItem {
        case 0:
            print("add")
        case 1:
            print("minus")
        default:
            return
        }
    }
}
