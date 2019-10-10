//
//  ReportingPositions.swift
//  HoneyCombStructure
//
//  Created by Apple on 06/10/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import Foundation

class ReportingPositions {
    
    var name : String = ""
    var id = 0
    var parentId = 0
    var isHead = false
    var level = 0
    
    var childs = [ReportingPositions]()
    
    init(){}
    
    init(_ name : String, _ id : Int, _ parentId : Int,_ isHead : Bool, _ level : Int) {
        self.name = name
        self.id = id
        self.parentId = parentId
        self.isHead = isHead
        self.level = level
    }
}
