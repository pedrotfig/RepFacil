//
//  ExpensesViewController.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 14/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var expenses : [Expenses] = []
    
        expenses.append(Expenses(nameAccount: "Light", expensive: 123))
        expenses.append(Expenses(nameAccount: "Internet", expensive: 100))
        expenses.append(Expenses(nameAccount: "Buys", expensive: 150))
        expenses.append(Expenses(nameAccount: "Water", expensive: 56))
    
        for i in 0..<4 {
            println("Expense: \(expenses[i].getName()) -> cost: \(expenses[i].getExpensive())")
        }
    
        var all : AllExpenses = AllExpenses()
    
        println("individual expense \(all.eachExpenses(expenses, person: SharedData.peopleList()))")
    
        for person in SharedData.peopleList() {
            var individualExpense: Double = person.room.getIndividualRent() + all.eachExpenses(expenses, person: SharedData.peopleList())
    
            println("\(person.name) pays \(individualExpense)")
    
        }
    }
    @IBAction func saveExpense(sender: AnyObject) {
        
    }
}
