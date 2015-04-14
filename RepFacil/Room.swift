//
//  Room.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class Room: NSObject {
    
    var id : UInt
    var name : String
    private(set) var owners : [Person]
    var rent : Double
    
    init(id : UInt, name : String, rent : Double) {
        self.id = id
        self.name = name
        self.rent = rent
        self.owners = []
    }
    
    func addOwner (name : String) {
        self.owners.append(Person(id: SharedData.nextPersonId, name: name, room: self))
        SharedData.nextPersonId++
    }
    
    func removeOwner (owner : Person) {
        for var i = 0; i < self.owners.count; i++ {
            if self.owners[i].id == owner.id {
                self.owners.removeAtIndex(i)
            }
        }
    }
    
    func getIndividualRent () -> Double {
        return self.rent/Double(self.owners.count)
    }
    
}
