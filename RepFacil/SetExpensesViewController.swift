//
//  SetExpensesViewController.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 19/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class SetExpensesViewController: UITableViewController {
    let expensesCellIdentifier = "SetExpensesCell"

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
        
        var cell : SetExpensesCell = self.tableView.dequeueReusableCellWithIdentifier(expensesCellIdentifier) as! SetExpensesCell
            
//        cell.correspondingPerson = SharedData.peopleList()[indexPath.row]
//        
//        cell.textLabel?.text = cell.correspondingPerson?.name
//        
//        
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }


}
