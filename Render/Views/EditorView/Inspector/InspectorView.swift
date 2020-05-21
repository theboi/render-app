//
//  InspectorView.swift
//  Render
//
//  Created by Ryan The on 13/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class InspectorView: NSView, NSTableViewDelegate, NSTableViewDataSource {
    
    private var attributes = [
        Attribute(named: "Type", of: .dropdown(options: ["Slider", "Button"]), saved: ""),
        Attribute(named: "Beat", of: .dropdown(options: ["None"]), saved: ""),
        Attribute(named: "Prop", of: .dropdown(options: ["Opacity", "Color", "Scale"]), saved: ""),
    ]
    
    private lazy var table = NSTableView()
    private lazy var title = NSTextField()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
            
        addSubview(table)
        addSubview(title)
        
        title.stringValue = "Slider 1"
        title.isEditable = false
        title.isBezeled = false
        title.backgroundColor = .clear
        title.font = NSFont.systemFont(ofSize: 12, weight: .bold)
        title.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(0)
            make.top.left.equalTo(self).offset(5)
            make.height.equalTo(25)
        }
        
        table.addTableColumn(NSTableColumn())
        table.rowHeight = 20
        table.delegate = self
        table.dataSource = self
        table.selectionHighlightStyle = .none
        table.intercellSpacing = NSSize(width: 17, height: 7)
        table.focusRingType = .none
        table.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(25)
            make.left.right.equalTo(self).offset(0)
            make.height.equalTo(1000)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return attributes.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = InspectorProp(frame: NSRect(), attribute: attributes[row])
        return cell
    }
    
    func setSliderValues(index: Int) {
        for i in attributes {
            
        }
        table.reloadData()
    }
}
