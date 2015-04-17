//
//  Room.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit
import CoreData

/**
* Room object containing the rent value and the current owners
*/
class Room: NSObject {
    
    /**
    * Room unique identifier
    */
    var id : UInt
    
    /**
    * Room name
    */
    var name : String
    
    /**
    * Array containing all the owners of this room
    */
    var owners : [Person]
    
    /**
    * Room rent value
    */
    var rent : Double
    
    
    /* shouldStore decides if the instance values will be stored with CoreData */
    init(id : UInt, name : String, rent : Double, owners : [Person], shouldStore : Bool) {
        self.id = id
        self.name = name
        self.rent = rent
        self.owners = owners
        
        if shouldStore {
            let entityDescription =
            NSEntityDescription.entityForName("RoomEntity",
                inManagedObjectContext: SharedData.managedObjectContext!)
            
            var room = RoomEntity(entity: entityDescription!,
                insertIntoManagedObjectContext: SharedData.managedObjectContext)
            
            room.id = id
            room.name = name
            room.rent = rent
            
            var error : NSError?
            SharedData.managedObjectContext?.save(&error)
        }
    }
    
    /**
    Adds a owner to the room.
    
    :param: name The owner's name
    */
    func addOwner (named name : String) {
        self.owners.append(Person(id: SharedData.nextPersonId, name: name, room: self, shouldStore: true))
        SharedData.nextPersonId++
    }
    
    /**
    Removes a owner from the room.
    
    :param: owner Owner instance to be removed
    */
    func removeOwner (owner : Person) {
        var i : Int = 0
        while i < self.owners.count {
            if self.owners[i].id == owner.id {
                self.owners[i].deleteFromDatabase()
                self.owners.removeAtIndex(i)
                i = self.owners.count
            }
            else {
                i++
            }
        }
    }
    
    /**
    Calculates the rent each of the room owners has to pay
    
    :returns: The individual rent value
    */
    func getIndividualRent () -> Double {
        return self.rent/Double(self.owners.count)
    }
    
    /**
    Gets the CoreData entity with the room values.
    
    :returns: The room CoreData entity
    */
    func getEntity () -> RoomEntity {
        let entityDescription =
        NSEntityDescription.entityForName("RoomEntity",
            inManagedObjectContext: SharedData.managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        var error: NSError?
        var results = SharedData.managedObjectContext?.executeFetchRequest(request,
            error: &error) as! [RoomEntity]
        
        var entity : RoomEntity? = nil
        if results.count > 0 {
            for result in results {
                if result.id == self.id {
                    entity = result
                }
                
            }
        }
        
        return entity!
    }
    
    /**
    Deletes a room entity from the CoreData
    */
    func deleteFromDatabase () {
        
        let entityDescription =
        NSEntityDescription.entityForName("RoomEntity",
            inManagedObjectContext: SharedData.managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        var error: NSError?
        var results = SharedData.managedObjectContext?.executeFetchRequest(request,
            error: &error) as! [RoomEntity]
        
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
