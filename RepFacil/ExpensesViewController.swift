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
    @IBOutlet weak var tableExpense: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 
            "Edit" button for left side of nav bar
        */
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
        self.tableExpense.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //add expenses
    @IBAction func saveExpense(sender: AnyObject) {
        if(!(self.nameExpense.text.isEmpty) && !(self.priceExpense.text.isEmpty)){
            if(SharedData.rooms.count != 0 && SharedData.peopleCount() != 0){
            SharedData.peopleList()[0].addExpense(named: self.nameExpense.text, withPrice: (self.priceExpense.text as NSString).doubleValue)

            self.tableExpense.reloadData()
            self.nameExpense.text = ""
            self.priceExpense.text = ""
            }
        }
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SharedData.expensesCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : ExpenseCell = self.tableExpense.dequeueReusableCellWithIdentifier("ExpenseCell") as! ExpenseCell
        
        
        cell.textLabel?.text = SharedData.expensesList()[indexPath.row].getName()
        cell.detailTextLabel?.text = String(format:"%.2f", SharedData.expensesList()[indexPath.row].getExpensive())
        
        return cell
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //dell cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if ( editingStyle == UITableViewCellEditingStyle.Delete ) {
            
            SharedData.peopleList()[0].expenses.removeAtIndex(indexPath.row)
            
            tableExpense.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.tableExpense.reloadData()
            
        }
        
    }
    
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
    }
}
