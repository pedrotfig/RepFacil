//
//  StoredData.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

struct SharedData {
    static var nextRoomId : UInt = 0
    static var nextPersonId : UInt = 0
    static var nextExpenseId : UInt = 0
    
    static var rooms : [Room] = []
    
    static func addRoom (named name : String, withRent rent : Double) {
        rooms.append(Room(id: nextPersonId, name: name, rent: rent))
        nextRoomId++
    }
    
    static func removeRoom (room : Room) {
        for i in 0 ..< rooms.count {
            if room.id == rooms[i].id {
                rooms.removeAtIndex(i)
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
    
    static func expensesCount () -> Int {
        var totalOfExpenses : Int
        totalOfExpenses = 0
        for person in peopleList() {
            for expense in person.expenses {
                totalOfExpenses++
            }
        }
        
        return totalOfExpenses
    }
    
    static func expensesList () -> [Expense] {
        var expensesArray : [Expense]
        expensesArray = []
        for person in peopleList() {
            for expense in person.expenses {
                expensesArray.append(expense)
            }
        }
        
        return expensesArray
    }
    
    
    /* temp variables */
    static var selectedRoom : Room? = nil
    
}