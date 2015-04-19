//
//  DebtsViewController.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/16/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class DebtsViewController: UITableViewController, UITextFieldDelegate {
    
    let debtCellIdentifier = "DebtCell"
    let allExpenses : AllExpenses = AllExpenses()
    
    let inDebtColor : UIColor = UIColor.redColor()
    let inCreditColor : UIColor = UIColor.blueColor()
    let zeroedColor : UIColor = UIColor.grayColor()
    
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
    
    func refreshRemainingDebt(debtCell: DebtCell) {
        let fullDebt : Double = (debtCell.correspondingPerson!.room.getIndividualRent() + allExpenses.eachExpenses(SharedData.expenses, person: SharedData.peopleList()))
        let payed : Double = (debtCell.payedUp.text as NSString).doubleValue
        let finalCredit : Double = payed - fullDebt
        
        if finalCredit < 0 {
            debtCell.detailTextLabel?.text = String(format: "%.2f", finalCredit)
            debtCell.detailTextLabel?.textColor = self.inDebtColor
        }
        else if finalCredit > 0 {
            debtCell.detailTextLabel?.text = String(format: "+%.2f", finalCredit)
            debtCell.detailTextLabel?.textColor = self.inCreditColor
        }
        else {
            debtCell.detailTextLabel?.text = String(format: "%.2f", finalCredit)
            debtCell.detailTextLabel?.textColor = self.zeroedColor
        }
    }

    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
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
        
        (debtCell.payedUp as! DebtPayedTextField).correspondingDebtCell = debtCell
        
        debtCell.textLabel?.text = debtCell.correspondingPerson?.name
        
        self.refreshRemainingDebt(debtCell)
        //debtCell.payedUp.addTarget(self, action:"refreshRemainingDebt", forControlEvents:UIControlEvents.EditingChanged)
        
        return debtCell
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.refreshRemainingDebt((textField as! DebtPayedTextField).correspondingDebtCell!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

}
