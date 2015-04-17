//
//  DebtsViewController.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/16/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class DebtsViewController: UITableViewController {
    
    let debtCellIdentifier = "DebtCell"
    let allExpenses : AllExpenses = AllExpenses()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Debts"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        
        return SharedData.peopleList().count
    }

    // UITableViewCells for each section and row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let debtCell : DebtCell = self.tableView.dequeueReusableCellWithIdentifier(debtCellIdentifier) as! DebtCell
        
        debtCell.correspondingPerson = SharedData.peopleList()[indexPath.row]
        debtCell.textLabel?.text = debtCell.correspondingPerson?.name
        debtCell.detailTextLabel?.text = String(format: "%.2f", (debtCell.correspondingPerson!.room.getIndividualRent() + allExpenses.eachExpenses(SharedData.expenses, person: SharedData.peopleList())))
        
        return debtCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
