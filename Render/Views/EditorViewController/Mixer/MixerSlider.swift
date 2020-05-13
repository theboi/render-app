//
//  MixerSlider.swift
//  Render
//
//  Created by Ryan The on 13/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class MixerSlider: NSView {

    private lazy var slider = NSSlider(value: 0.5, minValue: 0, maxValue: 2, target: self, action: #selector(onSliderChangeValue(sender:)))
    private lazy var indexLabel = NSTextField()
    private lazy var stack = NSStackView(views: [indexLabel, slider])

    init(index: Int) {
        super.init(frame: NSRect())
        addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).offset(0)
            make.height.equalTo(100)
        }
        stack.orientation = .horizontal
        stack.alignment = .top
        stack.wantsLayer = true
        stack.layer?.backgroundColor = NSColor.red.cgColor
        
        indexLabel.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 44))
        indexLabel.stringValue = String(index)
        indexLabel.isBezeled = false
        indexLabel.isEditable = false
        indexLabel.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func onSliderChangeValue(sender: Any) {
        
    }
    
}
