//
//  Person.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var id : Int
    var name : String
    var room : Room?
    
    init(id : Int, name : String = "", roomId : Int) {
        self.id = id
        self.name = name
        self.room = nil
        for room in SharedData.rooms {
            if roomId == room.id {
                self.room = room
            }
        }
    }
}
