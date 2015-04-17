//
//  RoomItemTabBar.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 17/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class RoomItemTabBar: UITabBarItem {
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()], forState: .Selected)
        
        UITabBar.appearance().tintColor = UIColor.redColor()
        return true
        
    }


}
