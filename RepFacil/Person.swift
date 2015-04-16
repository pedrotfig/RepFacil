//
//  Person.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var id : UInt
    var name : String
    var room : Room
    var expenses : [Expense]
    
    init(id : UInt, name : String, room : Room) {
        self.id = id
        self.name = name
        self.room = room
        self.expenses = []
    }
    
    func addExpense(named name : String, withPrice price : Double) {
        expenses.append(Expense(id: SharedData.nextExpenseId, nameAccount: name, expensive: price))
        SharedData.nextExpenseId++
    }
    
    func removeExpense (expense : Expense) {
        for i in 0 ..< self.expenses.count {
            if self.expenses[i].id == expense.id {
                self.expenses.removeAtIndex(i)
            }
        }
    }
}
