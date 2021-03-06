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

    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableExpense.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //add expenses
    @IBAction func saveExpense(sender: AnyObject) {
        if(!(self.nameExpense.text.isEmpty) && !(self.priceExpense.text.isEmpty)){
//            if(!(SharedData.rooms.isEmpty) && !(SharedData.peopleList().isEmpty)){
            SharedData.addExpense(named: self.nameExpense.text, withPrice: (self.priceExpense.text as NSString).doubleValue)

            self.tableExpense.reloadData()
            self.nameExpense.text = ""
            self.priceExpense.text = ""
            
            
        }
        
    }
    
    
    // total rows in default section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SharedData.expenses.count
    }
    
    // UITableViewCells for each section and row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : ExpenseCell = self.tableExpense.dequeueReusableCellWithIdentifier("ExpenseCell") as! ExpenseCell
        
        cell.correspondingExpense = SharedData.expenses[indexPath.row]
        
        cell.textLabel?.text = SharedData.expenses[indexPath.row].nameAccount
        cell.detailTextLabel?.text = String(format:"%.2f", SharedData.expenses[indexPath.row].expensive)
        
        return cell
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    //enable dell cell with animation - called when a row deletion action is confirmed
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //dell cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if ( editingStyle == UITableViewCellEditingStyle.Delete ) {
            
            SharedData.removeExpense(SharedData.expenses[indexPath.row])
            
            tableExpense.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.tableExpense.reloadData()
            
        }
        
    }
    
    //close keyboard
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // storyboard segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var expenseCell : ExpenseCell = sender as! ExpenseCell
        SharedData.selectedExpense = expenseCell.correspondingExpense
        
        println(expenseCell.correspondingExpense)
    }


}
