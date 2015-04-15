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
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        SharedData.addRoom(named: "Room 1", withRent: 800)
        SharedData.addRoom(named: "Room 2", withRent: 1200)
        
        SharedData.rooms[0].addOwner(named: "Jéssica")
        SharedData.rooms[1].addOwner(named: "Sophia")
        SharedData.rooms[1].addOwner(named: "Lúcia")
        
        
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
        
        roomCell.correspondingRooom = SharedData.rooms[indexPath.row]
        roomCell.textLabel?.text = roomCell.correspondingRooom?.name
        //roomCell.detailTextLabel?.text = String(format:"%f", roomCell.correspondingRooom?.rent)
        
        return roomCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

