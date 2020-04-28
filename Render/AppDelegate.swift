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
    
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
    
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
        window?.makeKeyAndOrderFront(nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        print("no")
        
        return true
    }
}


