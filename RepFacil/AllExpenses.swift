//
//  AllExpenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 14/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class AllExpenses: NSObject {
    
    
    func totalExpenses (expenses: [Expense]) -> Double {
        var total: Double = 0
        for i in 0 ..< expenses.count{
            total += expenses[i].getExpensive()
        }
        return total
    }
    
    func eachExpenses ( expenses: [Expense],  person: [Person]) -> Double {
        return totalExpenses(expenses) / Double(person.count)
    }
    
//    func resultExpenses (expenses: Expenses, persons : [Person] , individualPerson: Person) -> Double{
//        return eachExpenses(expenses, person: persons)
//    }
}
