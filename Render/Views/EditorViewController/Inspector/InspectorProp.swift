//
//  InspectorProp.swift
//  Render
//
//  Created by Ryan The on 14/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class InspectorProp: NSStackView {

    init(frame frameRect: NSRect, title: String) {
        super.init(frame: frameRect)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
