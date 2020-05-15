//
//  MixerView.swift
//  Render
//
//  Created by Ryan The on 12/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa
import SnapKit

class MixerView: NSView {
    
    private lazy var tableView = NSTableView()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.height.equalTo(1000)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-5)
            make.top.equalTo(self).offset(65)
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.headerView = nil
        tableView.focusRingType = .none
        tableView.selectionHighlightStyle = .sourceList
        tableView.rowHeight = 30
        tableView.intercellSpacing = NSSize(width: 0, height: 10)
        
        let col = NSTableColumn()
        tableView.addTableColumn(col)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension MixerView: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 8
    }
    
}

extension MixerView: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = MixerSlider(frame: NSRect(), index: row+1)
        return cell
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        
        
        let view = tableView.rowView(atRow: row, makeIfNecessary: false)
        view?.layer?.borderWidth = 1
        view?.layer?.borderColor = NSColor.controlColor.cgColor
        view?.layer?.cornerRadius = 4
        
        for i in 0...tableView.numberOfRows-1 {
            let otherView = tableView.rowView(atRow: i, makeIfNecessary: false)
            if i != row {
                otherView?.layer?.borderWidth = 0
                otherView?.layer?.borderColor = NSColor.clear.cgColor
            }
        }
        return true
    }
    
}
