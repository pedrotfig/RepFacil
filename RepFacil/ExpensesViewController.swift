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
        

    
        expenses.append(Expenses(nameAccount: "Energy", expensive: 123))
        expenses.append(Expenses(nameAccount: "Internet", expensive: 100))
        expenses.append(Expenses(nameAccount: "Shopping", expensive: 150))
        expenses.append(Expenses(nameAccount: "Water", expensive: 56))
    
    
        var all : AllExpenses = AllExpenses()
    
        println("individual expense \(all.eachExpenses(expenses, person: SharedData.peopleList()))")
    
        for person in SharedData.peopleList() {
            var individualExpense: Double = person.room.getIndividualRent() + all.eachExpenses(expenses, person: SharedData.peopleList())
    
            println("\(person.name) pays \(individualExpense)")
    
        }
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
    
    func tableView(tableExpense numberOfRowsInSection: UITableView, section: Int) -> Int {
        
        return expenses.count
    }
    
//    func tableView(tableExpense cellForRowAtIndexPath: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
//        
//        var cell : CellExpense = tableExpense.dequeueReusableCellWithIdentifier("cellExpense")
//        
//        
//        cell.labelName.text = expenses[indexPath.row].getName()
//        cell.labelPrice.text = String(stringInterpolationSegment: expenses[indexPath.row].getExpensive())
//        
//        return cell
//    }
 
    
}
