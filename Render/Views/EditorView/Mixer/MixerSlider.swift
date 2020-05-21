//
//  MixerSlider.swift
//  Render
//
//  Created by Ryan The on 14/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class MixerSlider: NSTableCellView, NSCopying {
    
    private lazy var slider = NSSlider(value: 0, minValue: 0, maxValue: 1, target: self, action: #selector(onSliderChangeValue(sender:)))
    private lazy var indexLabel = NSTextField()
    private lazy var stack = NSStackView(views: [indexLabel, slider])
    
    init(frame frameRect: NSRect, index: Int) {
        super.init(frame: frameRect)
        addSubview(stack)
        
        stack.orientation = .horizontal
        stack.alignment = .centerY
        stack.snp.makeConstraints { (make) in
            make.edges.equalTo(self).offset(0)
        }

        indexLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
        }
        indexLabel.alignment = .center
        indexLabel.stringValue = String(index)
        indexLabel.isBezeled = false
        indexLabel.isEditable = false
        indexLabel.font = NSFont.systemFont(ofSize: 14)
        indexLabel.wantsLayer = true
        indexLabel.layer?.cornerRadius = 8
        
        slider.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(50)
            make.right.equalTo(self).offset(-20)
        }
        
        objectValue = stack
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func onSliderChangeValue(sender: Any) {
        
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = MixerSlider(frame: NSRect(), index: 1)
        return copy
    }
    
}
