//
//  RoomEntity.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/17/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import Foundation
import CoreData

class RoomEntity: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var name: String
    @NSManaged var rent: NSNumber
    @NSManaged var contain: NSSet

}
