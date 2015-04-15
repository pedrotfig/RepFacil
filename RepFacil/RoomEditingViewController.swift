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
        
        SharedData.rooms[0].addOwner(named: "Jéssica")
        SharedData.rooms[1].addOwner(named: "Sophia")
        SharedData.rooms[1].addOwner(named: "Lúcia")
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.rooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var ownerCell : OwnerCell = self.ownersTableView.dequeueReusableCellWithIdentifier("OwnerCell") as! OwnerCell
        
        ownerCell.correspondingPerson = SharedData.selectedRoom?.owners[indexPath.row]
        ownerCell.textLabel?.text = ownerCell.correspondingPerson?.name
        
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
