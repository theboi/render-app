//
//  AppDelegate.swift
//  Render
//
//  Created by Ryan The on 17/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

//@NSApplicationMain
class AppDelegate: NSApplication, NSApplicationDelegate {
    
    private var window: NSWindow?
    private var windowController: NSWindowController?
    private lazy var toolbar = AppToolbar(identifier: .init(Character("D")))
    
    override init() {
        super.init()
        delegate = self
        mainMenu = AppMenu()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func orderFrontStandardAboutPanel(options optionsDictionary: [NSApplication.AboutPanelOptionKey : Any] = [:]) {
        super.orderFrontStandardAboutPanel(options: [.applicationIcon : NSImage(named: "AppIcon")!,
                                                     .applicationVersion: "0.1"])
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create Window
        let windowSize = NSSize(width: 480, height: 480)
        let screenSize = NSScreen.main?.frame.size ?? .zero
        let rect = NSMakeRect(screenSize.width/2 - windowSize.width/2,
                              screenSize.height/2 - windowSize.height/2,
                              windowSize.width,
                              windowSize.height)
        window = NSWindow(contentRect: rect,
                          styleMask: [.miniaturizable, .closable, .resizable, .titled],
                          backing: .buffered,
                          defer: false)

        // Load Content View Controller for Window
//        window?.windowController = WindowController()
        window?.titleVisibility = .hidden
//        window?.title = "Hello"
        window?.titlebarAppearsTransparent = true
        window?.contentViewController = EditorViewController()
        window?.toolbar = toolbar
        window?.makeKeyAndOrderFront(nil)
//        windowController?.showWindow(nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        return true
    }
}


