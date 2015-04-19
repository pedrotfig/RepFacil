//
//  StoredData.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit
import CoreData

/**
Struct with all shared data and methods used through the application.
*/
struct SharedData {
    static let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    /**
    Incrementing unique id for the rooms.
    */
    static var nextRoomId : UInt = 0
    
    /**
    Incrementing unique id for the people.
    */
    static var nextPersonId : UInt = 0
    
    /**
    Incrementing unique id for the expenses.
    */
    static var nextExpenseId : UInt = 0
    
    /**
    Array with all the rooms.
    */
    static var rooms : [Room] = []
    
    /**
    Array with all the expenses.
    */
    static var expenses : [Expense] = []
    
    /**
    Room currently selected in the Adding/Removing rooms screen
    */
    static var selectedRoom : Room? = nil
    
    static var selectedExpense : Expense? = nil
    
    /**
    Loads the state of the application data. Reads from the CoreData.
    */
    static func LoadState () {
        LoadRoomsAndOwners()
        LoadExpenses()
    }
    
    /**
    Loads the state of the rooms and its owners. Reads from the CoreData.
    */
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
    
    /**
    Loads the state of the expenses. Reads from the CoreData.
    */
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
    
    /**
    Creates a room.
    
    :param: name Room name
    :param: rent Room rent value
    */
    static func addRoom (named name : String, withRent rent : Double) {
        rooms.append(Room(id: nextRoomId, name: name, rent: rent, owners: [], shouldStore: true))
        nextRoomId++
    }
    
    /**
    Removes an existing room.
    
    :param: room Room instance to be removed
    */
    static func removeRoom (room : Room) {
        var i : Int = 0
        while i < rooms.count {
            if room.id == rooms[i].id {
                for owner in room.owners {
                    room.removeOwner(owner)
                }
                rooms[i].deleteFromDatabase()
                rooms.removeAtIndex(i)
                i = rooms.count
            }
            else {
                i++
            }
        }
    }
    
    /**
    Calculates the total of people registered across all rooms.
    
    :returns: The total of people
    */
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
    
    /**
    Creates an array with all people registered across all rooms
    
    :returns: The array of people
    */
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
    
    /**
    Creates an expense.
    
    :param: name The expense name
    :param: price The expense price value to be payed
    */
    static func addExpense (named name : String, withPrice price : Double) {
        expenses.append(Expense(id: nextExpenseId, nameAccount: name, expensive: price, shouldStore: true))
        nextExpenseId++
    }
    
    /**
    Removes an existing expense.
    
    :param: expense The expense instance to be removed
    */
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
    
}