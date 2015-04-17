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
    static var expenses : [Expense] = []
    
    static func addRoom (named name : String, withRent rent : Double) {
        rooms.append(Room(id: nextRoomId, name: name, rent: rent))
        nextRoomId++
    }
    
    static func removeRoom (room : Room) {
        var i : Int = 0
        while i < rooms.count {
            if room.id == rooms[i].id {
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
        expenses.append(Expense(id: nextExpenseId, nameAccount: name, expensive: price))
        nextExpenseId++
    }
    
    static func removeExpense (expense : Expense) {
        var i : Int = 0
        while i < expenses.count {
            if expense.id == expenses[i].id {
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