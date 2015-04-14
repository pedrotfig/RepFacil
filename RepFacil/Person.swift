//
//  Person.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var id : UInt
    var name : String
    var room : Room
    
    init(id : UInt, name : String, room : Room) {
        self.id = id
        self.name = name
        self.room = room
    }
}
