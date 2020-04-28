//
//  ViewController.swift
//  Render
//
//  Created by Ryan The on 17/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SceneKit
import SpriteKit

class RenderVC: NSViewController {
    
    
    @IBOutlet var timelineView: NSScrollView!
    @IBOutlet var zoomFuncs: NSSegmentedControl!
    @IBOutlet var renderView: SCNView!
    
    var timelineZoom = 1.0
    let scene = SCNScene()
    var optimalPOV = CGFloat(exactly: 2000)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineView.rulersVisible = true
        timelineView.hasHorizontalRuler = true
        timelineView.hasHorizontalScroller = true
        timelineView.documentView = NSView(frame: NSRect(x: 0, y: 0, width: 2000, height: 1))
        timelineView.magnification = CGFloat(timelineZoom)
        
        renderView.backgroundColor = NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        renderView.isPlaying = true
        
        let main = SCNNode(geometry: SCNPlane(width: 1920, height: 1080))
        scene.rootNode.addChildNode(main)
        renderView.allowsCameraControl = true
        renderView.preferredFramesPerSecond = 24 //23.98 NTSC
        renderView.scene = scene
        
        // for later
        renderView.snapshot()
        optimalPOV = renderView.pointOfView?.position.z

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

    @IBAction func onTimelineZoom(_ sender: NSMagnificationGestureRecognizer) {
        print("A")
        if sender.state == .began || sender.state == .changed {
            if sender.magnification > 0 {
                timelineView.magnification += 0.1
            } else {
                timelineView.magnification -= 0.1
            }
        }
    }
    
    override func viewDidAppear() {
//        performSegue(withIdentifier: "NewProject", sender: self)
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func onChangeZoomFuncs(_ sender: NSSegmentedControl) {
        switch sender.indexOfSelectedItem {
        case 0:
            renderView.pointOfView?.position.z -= 100
        case 1:
            renderView.pointOfView?.position = SCNVector3(0, 0, optimalPOV!)
            renderView.pointOfView?.rotation = SCNVector4(0, 0, 0, 0)
        case 2:
            renderView.pointOfView?.position.z += 100
        default:
            break
        }
    }
    
    
    //    func path() -> SKShapeNode {
    //        let line = SKShapeNode()
    //        let pathToDraw = CGMutablePath()
    //        pathToDraw.move(to: CGPoint(x: 50.0, y: 100.0))
    //        pathToDraw.addLine(to: CGPoint(x: 50.0, y: 50.0))
    //        pathToDraw.addLine(to: CGPoint(x: 70.0, y: 50.0))
    //        line.path = pathToDraw
    //        line.strokeColor = SKColor.red
    //        return line
    //    }
    
}

