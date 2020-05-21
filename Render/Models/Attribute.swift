//
//  Attribute.swift
//  Render
//
//  Created by Ryan The on 16/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

class Attribute {
    enum AttributeType {
        case dropdown(options: [String])
        case field(placeholder: String)
    }
    
    let name: String
    let type: AttributeType
    let saved: String
    
    init(named: String, of type: AttributeType, saved: String) {
        self.name = named
        self.type = type
        self.saved = saved
    }
}
