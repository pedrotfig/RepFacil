//
//  SetExpensesViewController.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 19/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class SetExpensesViewController: UITableViewController {
    @IBOutlet weak var tableExpense: UITableView!
    let allExpenses : AllExpenses = AllExpenses()
    var sub : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Expenses"


    }
    
    override func viewDidAppear(animated: Bool) {
                self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func SwitchChanged(sender: UISwitch) {
        if sender.on{
            self.sub = self.sub - 1
        }else{
            self.sub = self.sub + 1
        }
            self.viewDidAppear(true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.peopleCount()
    }
    
    func refresh(cell:UITableViewCell, count: Int){
        if(count != 0){
            let thisExpense : Double = (allExpenses.thisExpense(SharedData.selectedExpense!, numbers: count))
            
            cell.detailTextLabel?.text = String(format: "+%.2f", thisExpense)
        }else{
            cell.detailTextLabel?.text = String(format: "+%.2f", 0)

        }
    }
    
    // UITableViewCells for each section and row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : SetExpensesCell
        
        cell = (tableView.dequeueReusableCellWithIdentifier("SetExpensesCell") as! SetExpensesCell)
        
        cell.textLabel?.text = SharedData.peopleList()[indexPath.row].name
        
        var num = SharedData.peopleCount() - self.sub
        
        if(!(cell.SwitchExpense.on)){
            num = 0
        }
        
        self.refresh(cell, count: num)
        
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }


}
