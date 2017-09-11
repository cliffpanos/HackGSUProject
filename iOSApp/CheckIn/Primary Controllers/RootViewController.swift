//
//  RootViewController.swift
//  True Pass
//
//  Created by Cliff Panos on 4/1/17.
//  Copyright © 2017 Clifford Panos. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
    
    static weak var instance: RootViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RootViewController.instance = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //TODO
//        let moreItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
//        let currentItems = self.tabBar.items!
//        self.tabBar.setItems(([moreItem] + currentItems), animated: true)
    }
    
    var showingPassesTableView = false
    
    func switchToGuestRootController(withIdentifier identifier: String) {
        print("CHANGING GUEST ROOT VIEW CONTROLLER")
        let newVC = C.storyboard.instantiateViewController(withIdentifier: identifier)
        var viewControllers = self.viewControllers!
        viewControllers[1] = newVC
        self.viewControllers = viewControllers
        
        showingPassesTableView = identifier != "passInfoViewController"
    }

}

