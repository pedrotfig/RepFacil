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
    @IBOutlet weak var tableExpense: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expenses.append(Expenses(nameAccount: "Light", expensive: 100))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveExpense(sender: AnyObject) {
        if(!(nameExpense.text.isEmpty) && !(priceExpense.text.isEmpty)){
            
            expenses.append(Expenses(nameAccount: nameExpense.text, expensive: Double((priceExpense.text).toInt()!)))
            
            for i in 0..<(expenses.count) {
                println("Expense: \(expenses[i].getName()) -> cost: \(expenses[i].getExpensive())")
            }
            tableExpense.reloadData()
            nameExpense.text = ""
            priceExpense.text = ""
            
            var all : AllExpenses = AllExpenses()
            
            println("individual expense \(all.eachExpenses(expenses, person: SharedData.peopleList()))")
            
            for person in SharedData.peopleList() {
                var individualExpense: Double = person.room.getIndividualRent() + all.eachExpenses(expenses, person: SharedData.peopleList())
                
                println("\(person.name) pays \(individualExpense)")
                
            }
        }
        
    }
    
}
