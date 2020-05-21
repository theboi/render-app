//
//  Document.swift
//  Render
//
//  Created by Ryan The on 17/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class DocumentController: NSDocumentController {
    override var documentClassNames: [String] {
        return ["Document"]
    }
    
    override var defaultType: String? {
        return "Document"
    }
    
    override func documentClass(forType typeName: String) -> AnyClass? {
        return Document.self
    }
}

@objc(Document)
class Document: NSDocument {
    let contentViewController = EditorViewController()

    override func makeWindowControllers() {
        let window = NSWindow(contentViewController: contentViewController)
        window.setContentSize(K.screenSize)
        let windowController = NSWindowController(window: window)
        windowController.contentViewController = contentViewController
        addWindowController(windowController)
        window.makeKeyAndOrderFront(nil)
//        window.toolbar = 
    }
    
    override class var readableTypes: [String] {
        return ["public.text"]
    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        guard let string = String(data: data, encoding: .utf8) else { return }
        // MARK: TODO: Add modify app data here using code below
        //        contentViewController.mixerTopView
    }
}

//var content = Content(contentString: "")
//    var contentViewController: EditorViewController!
//    var windowController = NSWindowController()
//
//    override init() {
//        super.init()
//        // Add your subclass-specific initialization here.
//    }
//
//    override class var autosavesInPlace: Bool {
//        return false
//    }
//
//    override func makeWindowControllers() {
//        addWindowController(windowController)
//
//        if let contentVC = windowController.contentViewController as? EditorViewController {
//            contentVC.representedObject = content
//            contentViewController = contentVC
//        }
//
//    }
//
//    override func read(from data: Data, ofType typeName: String) throws {
//        content.read(from: data)
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
//    }
//
//    override func data(ofType typeName: String) throws -> Data {
//        return content.data()!
////        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
//    }
