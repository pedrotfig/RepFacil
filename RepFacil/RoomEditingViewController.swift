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
    }
    
    override func viewDidAppear(animated: Bool) {
        self.ownersTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //close keyboard
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    //add new owner
    @IBAction func onSavedOwnersClicked(sender: AnyObject) {
        if(!(self.newOwner.text.isEmpty)){
            
           SharedData.selectedRoom!.addOwner(named: self.newOwner.text)

            self.ownersTableView.reloadData()
            self.newOwner.text = ""

        }
    }
    
    //enable dell cell with animation - called when a row deletion action is confirmed
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //delete cell - called when a row deletion action is confirmed
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            println(SharedData.selectedRoom!.owners[indexPath.row].name)
            SharedData.selectedRoom!.removeOwner(SharedData.selectedRoom!.owners[indexPath.row])
            
            ownersTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.ownersTableView.reloadData()
            
        }
        
    }
    
     // total rows in default section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.selectedRoom!.owners.count
    }
    
    // UITableViewCells for each section and row
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
    
    // storyboard segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var roomCell : RoomCell = sender as! RoomCell
        SharedData.selectedRoom = roomCell.correspondingRoom
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
