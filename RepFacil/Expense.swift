//
//  Expenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 13/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

@objc class Expense: NSObject {

    private(set) var id : UInt
    private(set) var nameAccount: String = ""
    private(set) var expensive: Double = 0
    
    init(id : UInt, nameAccount : String, expensive : Double) {
        self.id = id
        self.nameAccount = nameAccount
        self.expensive = expensive
    }
    
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
    
}
