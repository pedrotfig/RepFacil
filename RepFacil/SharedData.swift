//
//  StoredData.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

struct SharedData {
    static var rooms : [Room] = []
    static var people : [Person] = []
    
    static func addRoom (room : Room) {
        rooms.append(room)
    }
    
    static func removeRoom (room : Room) {
        for var i = 0; i < rooms.count; i++ {
            if room.id == rooms[i].id {
                rooms.removeAtIndex(i)
            }
        }
    }
    
    static func addPerson (person : Person) {
        people.append(person)
    }
    
    static func removePerson (person : Person) {
        for var i = 0; i < people.count; i++ {
            if (person.id == people[i].id) {
                people.removeAtIndex(i)
                for var j = 0; j < rooms.count; j++ {
                    if let room = person.room {
                        if room.id == rooms[j].id {
                            room.removeOwner(person)
                        }
                    }
                }
                i = people.count
            }
        }
    }
}