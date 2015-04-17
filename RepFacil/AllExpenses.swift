//
//  AllExpenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 14/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

/**
* Object for certain calculation methods involving expenses
*/
class AllExpenses: NSObject {
    
    /**
    Calculates the sum of all expenses price values
    
    :param: expenses Array with all expenses
    :returns: Sum of all expense price values
    */
    func totalExpenses (expenses: [Expense]) -> Double {
        var total: Double = 0
        for i in 0 ..< expenses.count{
            total += expenses[i].expensive
        }
        return total
    }
    
    /**
    Calculates how much a person has to pay from expenses.
    
    :param: expenses Array with all expenses
    :param: person Array with all people
    :returns: the total expense value for each person
    */
    func eachExpenses ( expenses: [Expense],  person: [Person]) -> Double {
        return totalExpenses(expenses) / Double(person.count)
    }
    
//    func resultExpenses (expenses: Expenses, persons : [Person] , individualPerson: Person) -> Double{
//        return eachExpenses(expenses, person: persons)
//    }
}
