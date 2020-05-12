//
//  main.swift
//  Render
//
//  Created by Ryan The on 28/4/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Foundation
import Cocoa

// old code -- to switch back, change subclass of AppDelegate from NSApplication to NSObject and remove inits
//let delegate = AppDelegate()
//NSApplication.shared.delegate = delegate
//NSApplication.shared.mainMenu = AppMenu(title: "MainMenu")
//_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)

autoreleasepool {
    let App = AppDelegate.shared
    App.setActivationPolicy(.regular)
    App.applicationIconImage = NSImage(named: "AppIcon")
    App.run()
}
