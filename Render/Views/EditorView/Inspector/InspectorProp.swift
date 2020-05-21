//
//  InspectorProp.swift
//  Render
//
//  Created by Ryan The on 14/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class InspectorProp: NSStackView {

    private lazy var label = NSTextField()
    private lazy var inputObject = NSView()
    
    init(frame frameRect: NSRect, attribute: Attribute) {
        super.init(frame: frameRect)
        
        orientation = .horizontal
        alignment = .centerY
        
        switch attribute.type {
        case let .dropdown(options):
            let dropdown = NSPopUpButton(frame: NSRect(), pullsDown: false)
            dropdown.addItems(withTitles: options)
            inputObject = dropdown
            print(options)
        case let .field(placeholder):
            let field = NSTextField()
            field.placeholderString = placeholder
            inputObject = field
            print(placeholder)
        }
        
        addSubview(label)
        addSubview(inputObject)

        label.stringValue = attribute.name
        label.isEditable = false
        label.isBezeled = false
        label.alignment = .right
        label.backgroundColor = NSColor.clear
        label.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.right.equalTo(inputObject.snp.left).offset(-5)
        }
        
        inputObject.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self).offset(0)
            make.left.equalTo(self).offset(50)
            make.right.equalTo(self).offset(0)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
