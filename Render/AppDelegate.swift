//
//  AppDelegate.swift
//  Render
//
//  Created by Ryan The on 17/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var window: NSWindow?
    private var windowController: NSWindowController?
    private var appMenu: NSMenu?
    private var appToolbar = NSToolbar()
        
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
        window?.titlebarAppearsTransparent = true
        window?.contentViewController = RenderViewController()
        window?.menu = AppMenu()
        window?.makeKeyAndOrderFront(nil)
        window?.toolbar = appToolbar
//        windowController?.showWindow(nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        return true
    }
}


