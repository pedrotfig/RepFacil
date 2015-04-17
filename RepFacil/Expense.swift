//
//  Expenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 13/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit
import CoreData

/**
* Expense object containing the expense price value to be payed.
*/
@objc class Expense: NSObject {
    
    /**
    * Expense unique identifier
    */
    private(set) var id : UInt
    
    /**
    * Expense name
    */
    private(set) var nameAccount: String = ""
    
    /**
    * Expense price value
    */
    private(set) var expensive: Double = 0
    
    /* shouldStore decides if the instance values will be stored with CoreData */
    init(id : UInt, nameAccount : String, expensive : Double, shouldStore : Bool) {
        self.id = id
        self.nameAccount = nameAccount
        self.expensive = expensive
        
        if shouldStore {
            
            let entityDescription =
            NSEntityDescription.entityForName("ExpenseEntity",
                inManagedObjectContext: SharedData.managedObjectContext!)
            
            var expense = ExpenseEntity(entity: entityDescription!,
                insertIntoManagedObjectContext: SharedData.managedObjectContext)
            
            expense.id = id
            expense.name = nameAccount
            expense.price = expensive
            
            var error : NSError?
            SharedData.managedObjectContext?.save(&error)
        }
    }
    
    /**
    Deletes an expense entity from the CoreData
    */
    func deleteFromDatabase () {
        
        let entityDescription =
        NSEntityDescription.entityForName("ExpenseEntity",
            inManagedObjectContext: SharedData.managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        var error: NSError?
        var results = SharedData.managedObjectContext?.executeFetchRequest(request,
            error: &error) as! [ExpenseEntity]
        
        //let results = objects
        if results.count > 0 {
            for result in results {
                if result.id == self.id {
                    SharedData.managedObjectContext?.deleteObject(result)
                }
                
            }
        }
        
        SharedData.managedObjectContext?.save(&error)
    }
    
}
