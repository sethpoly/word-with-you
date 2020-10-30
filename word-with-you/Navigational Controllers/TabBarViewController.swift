//
//  TabBarViewController.swift
//  word-with-you
//
//  Created by Seth Polyniak on 10/30/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Loop through tab bar items and customize them
        for i in 0 ..< self.tabBar.items!.count {
            
            switch i {
                
            case 0:
            
                tabBar.items?[0].title = "Devotion"
                break;
                
            default:
                break
                
                
            }
            
        }
    }
    
    
    
    
    
    
    
}
