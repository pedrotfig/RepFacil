//
//  Room.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class Room: NSObject {
   
    var owners : [Person] = []
    var rent : Double = 0.0
    
    func addOwner (newOwner : Person) {
        owners.append(newOwner)
    }
    
}
