//
//  Room.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit
import CoreData

class Room: NSObject {
    
    var id : UInt
    var name : String
    var owners : [Person]
    var rent : Double
    
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
    
    func addOwner (named name : String) {
        self.owners.append(Person(id: SharedData.nextPersonId, name: name, room: self, shouldStore: true))
        SharedData.nextPersonId++
    }
    
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
    
    func getIndividualRent () -> Double {
        return self.rent/Double(self.owners.count)
    }
    
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
