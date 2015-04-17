//
//  ViewController.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class RoomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let roomCellIdentifier = "RoomCell"

    @IBOutlet weak var newRoomName: UITextField!
    @IBOutlet weak var newRoomRent: UITextField!
    @IBOutlet weak var saveRoomButton: UIButton!
    @IBOutlet weak var roomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Rooms"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onSavedButtonClicked(sender: AnyObject) {
        if(!(self.newRoomName.text.isEmpty) && !(self.newRoomRent.text.isEmpty)){
            
            SharedData.addRoom(named: self.newRoomName.text, withRent: (self.newRoomRent.text as NSString).doubleValue)
            
            self.roomsTableView.reloadData()
            self.newRoomName.text = ""
            self.newRoomRent.text = ""
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.rooms.count
    }
    
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
    
    @IBAction func onTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        var roomCell : RoomCell = sender as! RoomCell
        SharedData.selectedRoom = roomCell.correspondingRoom
    }
}

