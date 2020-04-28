//
//  CreateNode.swift
//  Render
//
//  Created by Ryan The on 23/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SceneKit

class DrawShapeNode: SCNNode {
    enum Shape {
        case square
        case circle
        case plane
    }
    
    var shape: Shape
    
    init(shape: Shape, color: NSColor) {
        self.shape = shape
        super.init()
        geometry = {
            switch (shape) {
            case .plane:
                return SCNPlane(width: 1920, height: 1080)
            case .square:
                return SCNPlane(width: 100, height: 100)
            default:
                return SCNPlane(width: 1920, height: 1080)
            }
        }()
        geometry?.firstMaterial?.diffuse.contents = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
