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
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.peopleCount()
    }
    
    // UITableViewCells for each section and row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : SetExpensesCell
        
        cell = (tableView.dequeueReusableCellWithIdentifier("SetExpensesCell") as! SetExpensesCell)
        
        cell.textLabel?.text = SharedData.peopleList()[indexPath.row].name
        
        if(SharedData.peopleCount() != 0){
            let thisExpense : Double = (allExpenses.thisExpense(SharedData.selectedExpense!, numbers: SharedData.peopleCount()))
        
            cell.detailTextLabel?.text = String(format: "+%.2f", thisExpense)
        }
        
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }


}
