//
//  ViewController.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class RoomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    let roomCellIdentifier = "RoomCell"

    @IBOutlet weak var newRoomName: UITextField!
    @IBOutlet weak var newRoomRent: UITextField!
    @IBOutlet weak var saveRoomButton: UIButton!
    @IBOutlet weak var roomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SharedData.LoadState()
        
        UITabBar.appearance().tintColor = UIColor.redColor()
        

    }
    
    override func viewDidAppear(animated: Bool) {
        self.roomsTableView.reloadData()
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //add new room
    @IBAction func onSavedButtonClicked(sender: AnyObject) {
        if(!(self.newRoomName.text.isEmpty) && !(self.newRoomRent.text.isEmpty)){
            
            SharedData.addRoom(named: self.newRoomName.text, withRent: (self.newRoomRent.text as NSString).doubleValue)
            
            self.roomsTableView.reloadData()
            self.newRoomName.text = ""
            self.newRoomRent.text = ""
        }
    }
    
    //dell cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if ( editingStyle == UITableViewCellEditingStyle.Delete ) {
            
            SharedData.removeRoom(SharedData.rooms[indexPath.row])
            
            roomsTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.roomsTableView.reloadData()
            
        }
        
    }
    
    // total rows in default section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.rooms.count
    }
    
    // UITableViewCells for each section and row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var roomCell : RoomCell = self.roomsTableView.dequeueReusableCellWithIdentifier(roomCellIdentifier) as! RoomCell
        
        roomCell.correspondingRoom = SharedData.rooms[indexPath.row]
        roomCell.textLabel?.text = roomCell.correspondingRoom?.name
        roomCell.detailTextLabel?.text = String(format:"%.2f", roomCell.correspondingRoom!.rent)
        
        return roomCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    //close keyboard
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // storyboard segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        var roomCell : RoomCell = sender as! RoomCell
        SharedData.selectedRoom = roomCell.correspondingRoom
    }
}

