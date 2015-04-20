//
//  Person.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit
import CoreData

/**
* Person object. Must own a room.
*/
class Person: NSObject {
    
    /**
    * Person unique identifier
    */
    var id : UInt
    
    /**
    * Person's name
    */
    var name : String
    
    /**
    * Person's room
    */
    var room : Room
    
    /* shouldStore decides if the instance values will be stored with CoreData */
    init(id : UInt, name : String, room : Room, shouldStore : Bool) {
        self.id = id
        self.name = name
        self.room = room
        if shouldStore {
            let entityDescription =
            NSEntityDescription.entityForName("PersonEntity",
                inManagedObjectContext: SharedData.managedObjectContext!)
            
            var person = PersonEntity(entity: entityDescription!,
                insertIntoManagedObjectContext: SharedData.managedObjectContext)
            
            person.id = id
            person.name = name
            person.contained = room.getEntity()
            
            var error : NSError?
            SharedData.managedObjectContext?.save(&error)
        }
    }
    
    /**
    Deletes a person entity from the CoreData
    */
    func deleteFromDatabase () {
        
        let entityDescription =
        NSEntityDescription.entityForName("PersonEntity",
            inManagedObjectContext: SharedData.managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        var error: NSError?
        var results = SharedData.managedObjectContext?.executeFetchRequest(request,
            error: &error) as! [PersonEntity]
        
        if results.count > 0 {
            for result in results {
                if result.id == self.id {
                    SharedData.managedObjectContext?.deleteObject(result)
                }
                
            }
        }
        
        SharedData.managedObjectContext?.save(&error)
    }
}
