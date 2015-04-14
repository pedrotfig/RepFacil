//
//  AllExpenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 14/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class AllExpenses: NSObject {
    
    
    func totalExpenses (expenses: [Expenses]) -> Double {
        var total: Double = 0
        for i in 0 ..< expenses.count{
            total += expenses[i].getExpensive()
        }
        return total
    }
    
    func eachExpenses (expense expenses: [Expenses], andPerson person: [Person]) -> Double {
        return totalExpenses(expenses) / Double(person.count)
    }
    
    func resultExpenses (expenses: Expenses, person : [Person] , individualPerson: Person) -> Double{
        return eachExpenses(expense: expenses, andPerson: person) + individualPerson.room.getIndividualRent()
    }
}
