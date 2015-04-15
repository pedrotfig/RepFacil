//
//  ViewController.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/13/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class RoomsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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


}
