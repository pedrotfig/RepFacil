//
//  ExpenseEntity.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/17/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import Foundation
import CoreData

class ExpenseEntity: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var name: String
    @NSManaged var price: NSNumber

}
