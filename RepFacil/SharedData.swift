//
//  StoredData.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

struct SharedData {
    static var nextRoomId : UInt = 0
    static var nextPersonId : UInt = 0
    
    static var rooms : [Room] = []
    
    static func addRoom (named name : String, withRent rent : Double) {
        rooms.append(Room(id: nextPersonId, name: name, rent: rent))
        nextRoomId++
    }
    
    static func removeRoom (room : Room) {
        for i in 0 ..< rooms.count {
            if room.id == rooms[i].id {
                rooms.removeAtIndex(i)
            }
        }
    }
}