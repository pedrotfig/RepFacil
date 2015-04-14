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
    
    static func addPerson (person : Person) {
        people.append(person)
    }
}