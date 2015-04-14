//
//  AllExpenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 14/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class AllExpenses: NSObject {
    
    var person : [Person] = []
    
    func totalExpenses (expenses: [Expenses]) -> Double {
        var total: Double = 0
        for i in 0 ..< expenses.count{
            total += expenses[i].getExpensive()
        }
        return total
    }
    
    func eachExpenses (expenses: [Expenses]) -> Double {
        return totalExpenses(expenses) / Double(self.person.count)
    }
    
    func resultExpenses (expenses: [Expenses], person: Person)-> Double{
        return eachExpenses(expenses) + person.room!.getIndividualRent()
    }
}
