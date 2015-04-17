//
//  Expenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 13/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit
import CoreData

@objc class Expense: NSObject {
    
    private(set) var id : UInt
    private(set) var nameAccount: String = ""
    private(set) var expensive: Double = 0
    
    let entityDescription =
    NSEntityDescription.entityForName("ExpenseEntity",
        inManagedObjectContext: SharedData.managedObjectContext!)
    
    init(id : UInt, nameAccount : String, expensive : Double, shouldStore : Bool) {
        self.id = id
        self.nameAccount = nameAccount
        self.expensive = expensive
        
        if (shouldStore) {
            
            var expense = ExpenseEntity(entity: entityDescription!,
                insertIntoManagedObjectContext: SharedData.managedObjectContext)
            
            expense.id = id
            expense.name = nameAccount
            expense.price = expensive
            
            var error : NSError?
            SharedData.managedObjectContext?.save(&error)
        }
    }
    
    func deleteFromDatabase () {
        
    }
    
    /*
    func addExpense(name: String, cost: Double){
        
        setName(name)
        newExpensive(cost)
    }
    
    func setName(newAccount: String){
        self.nameAccount = newAccount
    }
    
    func getName() -> String{
        return self.nameAccount
    }
    
    func newExpensive(newExpensive: Double){
        self.expensive = newExpensive
    }
    
    func getExpensive() -> Double{
        return expensive
    }
    */
}
