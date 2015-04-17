//
//  StoredData.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit
import CoreData

struct SharedData {
    static let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    static var nextRoomId : UInt = 0
    static var nextPersonId : UInt = 0
    static var nextExpenseId : UInt = 0
    
    static var rooms : [Room] = []
    static var expenses : [Expense] = []
    
    static func LoadState () {
        LoadRoomsAndOwners()
        LoadExpenses()
    }
    
    static func LoadRoomsAndOwners () {
        let entityDescription =
        NSEntityDescription.entityForName("RoomEntity",
            inManagedObjectContext: managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        //let pred = NSPredicate(format: "(name = %@)", name.text)
        //request.predicate = pred
        
        var error: NSError?
        
        var objects = managedObjectContext?.executeFetchRequest(request,
            error: &error) as! [RoomEntity]
        
        let results = objects
        if results.count > 0 {
            for result in results {
                
                var room : Room = Room(id: result.id.unsignedLongValue, name: result.name, rent: result.rent.doubleValue, owners: [], shouldStore: false)
                
                 /* Load owners */
                var ownersEntityDescrition = NSEntityDescription.entityForName("PersonEntity",
                    inManagedObjectContext: managedObjectContext!)
                var ownerRequest = NSFetchRequest()
                ownerRequest.entity = ownersEntityDescrition
                var ownersEntities = managedObjectContext?.executeFetchRequest(ownerRequest,
                    error: &error) as! [PersonEntity]
                var owners: [Person] = []
                
                for ownerEntity in ownersEntities {
                    if ownerEntity.contained.id == room.id {
                        room.owners.append(Person(id: ownerEntity.id.unsignedLongValue, name: ownerEntity.name, room: room, shouldStore: false))
                        
                        if nextPersonId <= ownerEntity.id.unsignedLongValue {
                            nextPersonId = ownerEntity.id.unsignedLongValue + 1
                        }
                    }
                }
                
                /* Load current room in loop */
                rooms.append(room)
                
                if nextRoomId <= result.id.unsignedLongValue {
                    nextRoomId = result.id.unsignedLongValue + 1
                }
            }
        }
    }
    
    static func LoadExpenses () {
        let entityDescription =
        NSEntityDescription.entityForName("ExpenseEntity",
            inManagedObjectContext: managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        //let pred = NSPredicate(format: "(name = %@)", name.text)
        //request.predicate = pred
        
        var error: NSError?
        
        var objects = managedObjectContext?.executeFetchRequest(request,
            error: &error) as! [ExpenseEntity]
        
        let results = objects
        if results.count > 0 {
            for result in results {
                expenses.append(Expense(id: result.id.unsignedLongValue, nameAccount: result.name, expensive: result.price.doubleValue, shouldStore: false))
                
                if nextExpenseId <= result.id.unsignedLongValue {
                    nextExpenseId = result.id.unsignedLongValue + 1
                }
            }
        }
    }
    
    static func addRoom (named name : String, withRent rent : Double) {
        rooms.append(Room(id: nextRoomId, name: name, rent: rent, owners: [], shouldStore: true))
        nextRoomId++
    }
    
    static func removeRoom (room : Room) {
        var i : Int = 0
        while i < rooms.count {
            if room.id == rooms[i].id {
                for owner in room.owners {
                    room.removeOwner(owner)
                }
                rooms.removeAtIndex(i)
                i = rooms.count
            }
            else {
                i++
            }
        }
    }
    
    static func peopleCount () -> Int {
        var totalOfPeople : Int
        totalOfPeople = 0
        for room in rooms {
            for person in room.owners {
                totalOfPeople++
            }
        }
        
        return totalOfPeople
    }
    
    static func peopleList () -> [Person] {
        var peopleArray : [Person]
        peopleArray = []
        for room in rooms {
            for person in room.owners {
                peopleArray.append(person)
            }
        }
        
        return peopleArray
    }
    
    static func addExpense (named name : String, withPrice price : Double) {
        expenses.append(Expense(id: nextExpenseId, nameAccount: name, expensive: price, shouldStore: true))
        nextExpenseId++
    }
    
    static func removeExpense (expense : Expense) {
        var i : Int = 0
        while i < expenses.count {
            if expense.id == expenses[i].id {
                expense.deleteFromDatabase()
                expenses.removeAtIndex(i)
                i = expenses.count
            }
            else {
                i++
            }
        }
    }
    
    /* temp variables */
    static var selectedRoom : Room? = nil
    
}