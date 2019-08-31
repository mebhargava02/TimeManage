//
//  FirstViewController.swift
//  Organise 1
//
//  Created by MEHUL BHARGAVA on 04/11/17.
//  Copyright © 2017 MEHUL BHARGAVA. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(toggleSideMenu),
                                                name:NSNotification.Name("ToggleSideMenu"),
                                                object: nil)
    }
    
    @objc func toggleSideMenu() {
        if Constant.MyClassConstants.isAddClassesclicked {
            Constant.MyClassConstants.isAddClassesclicked = false
             sideMenuConstraint.constant = -240
            sideMenuOpen = false
            
        } else {
            Constant.MyClassConstants.isAddClassesclicked = true
             sideMenuConstraint.constant = 0
            
            if sideMenuOpen {
                sideMenuOpen = false
                sideMenuConstraint.constant = -240
            } else {
                sideMenuOpen = true
                sideMenuConstraint.constant = 0
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
        }
     
    }
    

}

