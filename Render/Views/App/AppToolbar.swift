//
//  AppToolbar.swift
//  Render
//
//  Created by Ryan The on 4/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class AppToolbar: NSToolbar, NSToolbarDelegate {
    override init(identifier: NSToolbar.Identifier) {
        super.init(identifier: identifier)
        
        
        allowsUserCustomization = true
//        delegate = self
//        let flexibleSpace = NSToolbarItem(itemIdentifier: .flexibleSpace)
//        insertItem(withItemIdentifier: .print, at: 0)
        print(items)
        
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
        toolbarItem.label = "Hello"
        toolbarItem.image = NSImage(named: "AppIcon")
        toolbarItem.target = self
        toolbarItem.action = #selector(test)
        return toolbarItem
    }
    
    @objc func test() {}
}
