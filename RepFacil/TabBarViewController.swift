//
//  TabBarViewController.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 17/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController,UITabBarDelegate, UITabBarControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(tabBar: UITabBar, didBeginCustomizingItems items: [AnyObject]) {
        self.view.tintColor = UIColor.redColor()
        
    }
}