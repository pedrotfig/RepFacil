//
//  ExpensesViewController.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 14/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {


    @IBOutlet weak var nameExpense: UITextField!
    @IBOutlet weak var priceExpense: UITextField!
    var expenses : [Expenses] = []
    @IBOutlet weak var tableExpense: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.expenses.append(Expenses(nameAccount: "Energy", expensive: 123))
        self.expenses.append(Expenses(nameAccount: "Internet", expensive: 100))
        self.expenses.append(Expenses(nameAccount: "Shopping", expensive: 150))
        self.expenses.append(Expenses(nameAccount: "Water", expensive: 56))
    
        
        self.tableExpense.reloadData()
        
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
        if(!(self.nameExpense.text.isEmpty) && !(self.priceExpense.text.isEmpty)){
            
            self.expenses.append(Expenses(nameAccount: self.nameExpense.text, expensive: Double((priceExpense.text).toInt()!)))
            
            for i in 0..<(self.expenses.count) {
                println("Expense: \(self.expenses[i].getName()) -> cost: \(self.expenses[i].getExpensive())")
            }
            self.tableExpense.reloadData()
            self.nameExpense.text = ""
            self.priceExpense.text = ""
            
            var all : AllExpenses = AllExpenses()
            
            println("individual expense \(all.eachExpenses(self.expenses, person: SharedData.peopleList()))")
            
            for person in SharedData.peopleList() {
                var individualExpense: Double = person.room.getIndividualRent() + all.eachExpenses(expenses, person: SharedData.peopleList())
                
                println("\(person.name) pays \(individualExpense)")
                
            }
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.expenses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : ExpenseCell = self.tableExpense.dequeueReusableCellWithIdentifier("ExpenseCell") as! ExpenseCell
        
        
        cell.textLabel?.text = self.expenses[indexPath.row].getName()
        cell.detailTextLabel?.text = String(stringInterpolationSegment: self.expenses[indexPath.row].getExpensive())
        
        return cell
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
    }
}
