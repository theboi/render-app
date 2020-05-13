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

class RenderingView: NSView {
    
    private lazy var sceneView = SCNView(frame: NSRect())
    private lazy var scene = SCNScene()
    private lazy var optimalPOV = CGFloat(exactly: 2000)
    private lazy var resizer = NSSegmentedControl(labels: ["􀅼", "􀊯", "􀅽"], trackingMode: .momentaryAccelerator, target: self, action: #selector(onResize(sender:)))
    
    override init(frame: NSRect) {
        super.init(frame: frame)

        super.addSubview(sceneView)
        
        resizer.segmentStyle = .texturedSquare
        sceneView.addSubview(resizer)
        resizer.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.right.bottom.equalTo(self).offset(-10)
        }
        sceneView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(ConstraintInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        sceneView.backgroundColor = NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        sceneView.isPlaying = true
        
        let root = SCNNode(geometry: SCNPlane(width: 1920, height: 1080))
        scene.rootNode.addChildNode(root)
        sceneView.allowsCameraControl = true
        sceneView.preferredFramesPerSecond = 50 //23.98 NTSC (If scene seems to lag it is because of this)
        sceneView.scene = scene
        
        sceneView.snapshot()
        // for later
        optimalPOV = sceneView.pointOfView?.position.z
        
        root.geometry?.firstMaterial?.diffuse.contents = NSColor.black
        
        //        let text = SCNText(string: "THIS IS LIVING NOW", extrusionDepth: 10)
        //        text.firstMaterial?.diffuse.contents = NSColor.white
        //        text.font = NSFont(name: "Bytheway", size: 120)
        
        let text = SCNPlane(width: 1000, height: 1000)
        let circle = SKShapeNode(circleOfRadius: 10)
        circle.fillColor = .red
        text.firstMaterial?.diffuse.contents = circle
        root.addChildNode(SCNNode(geometry: text))
        
        //        main.addChildNode(DrawShapeNode(shape: .square, color: .red))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func onResize(sender: NSSegmentedControl) {
        switch sender.indexOfSelectedItem {
        case 0: sceneView.pointOfView?.position.z -= sender.isContinuous ? 70 : 100
        case 1:
            sceneView.pointOfView?.position = SCNVector3(0, 0, optimalPOV!)
            sceneView.pointOfView?.rotation = SCNVector4(0, 0, 0, 0)
        case 2: sceneView.pointOfView?.position.z += sender.isContinuous ? 70 : 100
        default: break
        }
    }
}
