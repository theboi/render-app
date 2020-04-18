//
//  ViewController.swift
//  Render
//
//  Created by Ryan The on 17/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SpriteKit

class RenderVC: NSViewController {
    
    @IBOutlet var renderView: SKView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.preferredContentSize = NSSize(width: NSScreen.main?.frame.width ?? 100, height: NSScreen.main?.frame.height ?? 100)
        let scene = SKScene(size: view.bounds.size)
        
        // Set the scene coordinates (0, 0) to the center of the screen.
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
//        let image = SKSpriteNode(imageNamed: "image")
//        scene.addChild(image)
        scene.scaleMode = SKSceneScaleMode.aspectFill
        scene.backgroundColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 1)
        scene.addChild(path())
        let rect = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        scene.addChild(rect)
        let skView = renderView!
        skView.showsFPS = true
        skView.presentScene(scene)
        
    }
    
    
    override func viewDidAppear() {
//        performSegue(withIdentifier: "NewProject", sender: self)
    }
    
    
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func path() -> SKShapeNode {
        let line = SKShapeNode()
        let pathToDraw = CGMutablePath()
        pathToDraw.move(to: CGPoint(x: 50.0, y: 100.0))
        pathToDraw.addLine(to: CGPoint(x: 50.0, y: 50.0))
        pathToDraw.addLine(to: CGPoint(x: 70.0, y: 50.0))
        line.path = pathToDraw
        line.strokeColor = SKColor.red
        return line
    }
    
}

