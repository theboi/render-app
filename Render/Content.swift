//
//  Content.swift
//  Render
//
//  Created by Ryan The on 21/5/20.
//  Copyright © 2020 Ryan The. All rights reserved.
//

import Cocoa

class Content: NSObject {
    dynamic var contentString = ""
    
    public init(contentString: String) {
        self.contentString = contentString
    }
    
    func read(from data: Data) {
        contentString = String(bytes: data, encoding: .utf8)!
    }
    
    func data() -> Data? {
        return contentString.data(using: .utf8)
    }
}
