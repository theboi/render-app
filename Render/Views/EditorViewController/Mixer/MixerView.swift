//
//  MixerView.swift
//  Render
//
//  Created by Ryan The on 12/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SnapKit

class MixerView: NSView {
    
    private lazy var slider = MixerSlider(index: 1)
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(ConstraintInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        addSubview(slider)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
