//
//  ExpensesViewController.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 14/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {


    @IBOutlet weak var nameExpense: UITextField!
    @IBOutlet weak var priceExpense: UITextField!
    @IBOutlet var expenses : [Expenses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        expenses.append(Expenses(nameAccount: "Light", expensive: 123))
        expenses.append(Expenses(nameAccount: "Internet", expensive: 100))
        expenses.append(Expenses(nameAccount: "Buys", expensive: 150))
        expenses.append(Expenses(nameAccount: "Water", expensive: 56))
    
    
        var all : AllExpenses = AllExpenses()
    
        println("individual expense \(all.eachExpenses(expenses, person: SharedData.peopleList()))")
    
        for person in SharedData.peopleList() {
            var individualExpense: Double = person.room.getIndividualRent() + all.eachExpenses(expenses, person: SharedData.peopleList())
    
            println("\(person.name) pays \(individualExpense)")
    
        }
    }
    
    
    @IBAction func saveExpense(sender: AnyObject) {
        if(!(nameExpense.text.isEmpty) && !(priceExpense.text.isEmpty)){
            
            expenses.append(Expenses(nameAccount: nameExpense.text, expensive: Double((priceExpense.text).toInt()!)))
            
            for i in 0..<(expenses.count) {
                println("Expense: \(expenses[i].getName()) -> cost: \(expenses[i].getExpensive())")
            }
        }
    }
    
}
