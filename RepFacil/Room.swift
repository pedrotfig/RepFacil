//
//  Room.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class Room: NSObject {
    
    var id : Int
    var name : String
    private(set) var owners : [Person]
    var rent : Double
    
    init(id : Int = 0, name : String = "", rent : Double = 0) {
        self.id = id
        self.name = name
        self.rent = rent
        self.owners = []
    }
    
    func addOwner (newOwner : Person) {
        self.owners.append(newOwner)
    }
    
    func removeOwner (ownerId : Int) {
        self.owners.removeAtIndex(ownerId)
    }
    
    func getIndividualRent () -> Double {
        return self.rent/Double(self.owners.count)
    }
    
}
