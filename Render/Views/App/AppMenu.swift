//
//  AppMenu.swift
//  Render
//
//  Created by Ryan The on 2/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class AppMenu: NSMenu {
    private lazy var applicationName = ProcessInfo.processInfo.processName
    
    override init(title: String) {
        super.init(title: title)
                
        let mainTab = NSMenuItem()
        mainTab.submenu = NSMenu(title: "MainMenu")
        mainTab.submenu?.items = [
            NSMenuItem(title: "About \(applicationName)", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: ""),
            NSMenuItem.separator(),
            NSMenuItem(title: "Preferences...", action: #selector(NSApplication.terminate(_:)), keyEquivalent: ","),
            NSMenuItem.separator(),
            NSMenuItem(title: "Hide \(applicationName)", action: #selector(NSApplication.hide(_:)), keyEquivalent: "h"),
            NSMenuItem(title: "Hide Others", target: self, action: #selector(NSApplication.hideOtherApplications(_:)), keyEquivalent: "h", modifier: .init(arrayLiteral: [.command, .option])),
            NSMenuItem.separator(),
            NSMenuItem(title: "Quit \(applicationName)", action: #selector(NSApplication.shared.terminate(_:)), keyEquivalent: "q")
        ]
        
        let fileTab = NSMenuItem()
        fileTab.submenu = NSMenu(title: "File")
        fileTab.submenu?.items = [
            NSMenuItem(title: "New", action: #selector(NSApplication.copy), keyEquivalent: "n"),
            NSMenuItem.separator(),
            NSMenuItem(title: "Save", action: #selector(NSApplication.copy), keyEquivalent: "s"),
            NSMenuItem(title: "Save As...", action: #selector(NSApplication.copy), keyEquivalent: "S"),
            NSMenuItem.separator(),
            NSMenuItem(title: "Export", action: #selector(NSApplication.copy), keyEquivalent: "E"),
        ]
        
        let editTab = NSMenuItem()
        editTab.submenu = NSMenu(title: "Edit")
        editTab.submenu?.items = [
            NSMenuItem(title: "Undo", action: #selector(UndoManager.undo), keyEquivalent: "z"),
            NSMenuItem(title: "Redo", action: #selector(UndoManager.redo), keyEquivalent: "Z"),
            NSMenuItem.separator(),
            NSMenuItem(title: "Cut", action: #selector(NSApplication.copy), keyEquivalent: "x"),
            NSMenuItem(title: "Copy", action: #selector(NSApplication.copy), keyEquivalent: "c"),
            NSMenuItem(title: "Paste", action: #selector(NSApplication.copy), keyEquivalent: "v"),
            NSMenuItem.separator(),
            NSMenuItem(title: "Delete", target: self, action: #selector(NSApplication.copy), keyEquivalent: "⌫", modifier: .init()),
            NSMenuItem(title: "Duplicate", action: #selector(NSApplication.copy), keyEquivalent: "d"),
        ]
        
        let helpTab = NSMenuItem()
        let helpTabSearch = NSMenuItem()
        helpTabSearch.view = NSTextField()
        helpTab.submenu = NSMenu(title: "Help")
        helpTab.submenu?.items = [
            helpTabSearch,
            NSMenuItem(title: "Documentation", target: self, action: #selector(openDoc(_:)), keyEquivalent: ""),
            NSMenuItem(title: "Feedback", action: #selector(method(for:)), keyEquivalent: ""),
        ]
        items = [mainTab, fileTab, editTab, helpTab]
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func openDoc(_: Any) {
        NSWorkspace.shared.open(URL(string: "https://theboi.github.io/render-app/")!)
    }
}

extension NSMenuItem {
    convenience init(title string: String, target: AnyObject = self as AnyObject, action selector: Selector?, keyEquivalent charCode: String, modifier: NSEvent.ModifierFlags = .command) {
        self.init(title: string, action: selector, keyEquivalent: charCode)
        keyEquivalentModifierMask = modifier
        self.target = target
    }
}
