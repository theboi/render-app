//
//  SceneView.swift
//  Render
//
//  Created by Ryan The on 4/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SnapKit
import SceneKit
import SpriteKit

class SceneView: NSView {
    
    private var sceneView = SCNView(frame: NSRect())
    private var scene = SCNScene()
    private var optimalPOV = CGFloat(exactly: 2000)
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        super.addSubview(sceneView)
        sceneView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(ConstraintInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        sceneView.backgroundColor = NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        sceneView.isPlaying = true
        
        let main = SCNNode(geometry: SCNPlane(width: 1920, height: 1080))
        scene.rootNode.addChildNode(main)
        sceneView.allowsCameraControl = true
        sceneView.preferredFramesPerSecond = 24 //23.98 NTSC (If scene seems to lag it is because of this)
        sceneView.scene = scene
        
        // for later
        //        sceneView.snapshot()
        //        optimalPOV = sceneView.pointOfView?.position.z
        
        main.geometry?.firstMaterial?.diffuse.contents = NSColor.black
        
        //        let text = SCNText(string: "THIS IS LIVING NOW", extrusionDepth: 10)
        //        text.firstMaterial?.diffuse.contents = NSColor.white
        //        text.font = NSFont(name: "Bytheway", size: 120)
        
        let text = SCNPlane(width: 1000, height: 1000)
        let circle = SKShapeNode(circleOfRadius: 10)
        circle.fillColor = .red
        text.firstMaterial?.diffuse.contents = circle
        main.addChildNode(SCNNode(geometry: text))
        
        //        main.addChildNode(DrawShapeNode(shape: .square, color: .red))
    }
    
}
