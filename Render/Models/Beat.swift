//
//  Data.swift
//  Render
//
//  Created by Ryan The on 13/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class Beat {
    enum BeatType {
        case slider
        case button
    }
    
    let type: BeatType
    let duration: TimeInterval
    let value: [Double]
    
    init(type: BeatType, duration: TimeInterval, value: [Double]) {
        self.type = type
        self.duration = duration
        self.value = value
    }
}
