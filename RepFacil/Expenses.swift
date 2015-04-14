//
//  Expenses.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 13/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

@objc class Expenses: NSObject {

    private(set) var nameAccount: String = ""
    
    private(set) var expensive: Double = 0
    
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