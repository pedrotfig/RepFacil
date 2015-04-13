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
    private(set) var owners : [Person]
    var rent : Double
    
    init(id : Int = 0, rent : Double = 0) {
        self.id = id
        self.rent = rent
        self.owners = []
    }
    
    func addOwner (newOwner : Person) {
        owners.append(newOwner)
    }
    
}
