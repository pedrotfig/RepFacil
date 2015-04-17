//
//  RoomEditingViewController.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/14/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class RoomEditingViewController:UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var newOwner: UITextField!
    @IBOutlet weak var ownersTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = "Owners"
        
        self.ownersTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onSavedOwnersClicked(sender: AnyObject) {
        if(!(self.newOwner.text.isEmpty)){
            
           SharedData.selectedRoom!.addOwner(named: self.newOwner.text)

            self.ownersTableView.reloadData()
            self.newOwner.text = ""

        }
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //dell cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, cforRowAtIndexPath indexPath: NSIndexPath) {
        if ( editingStyle == UITableViewCellEditingStyle.Delete ) {
            println(SharedData.selectedRoom!.owners[indexPath.row].name)
            SharedData.selectedRoom!.removeOwner(SharedData.selectedRoom!.owners[indexPath.row])
            
            ownersTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.ownersTableView.reloadData()
            
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.selectedRoom!.owners.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var ownerCell : OwnerCell = self.ownersTableView.dequeueReusableCellWithIdentifier("OwnerCell") as! OwnerCell
        
        ownerCell.correspondingPerson = SharedData.selectedRoom!.owners[indexPath.row]
        ownerCell.textLabel?.text = ownerCell.correspondingPerson!.name
        
        return ownerCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
