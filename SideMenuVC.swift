//
//  SideMenuVC.swift
//  Organise 1
//
//  Created by MEHUL BHARGAVA on 04/11/17.
//  Copyright © 2017 MEHUL BHARGAVA. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    
    switch indexPath.row {
    case 0:
        NotificationCenter.default.post(name: NSNotification.Name("ShowClasses"), object: nil)
        
    case 1:
        NotificationCenter.default.post(name: NSNotification.Name("ShowTasks"), object: nil)
        
    case 2:
        NotificationCenter.default.post(name: NSNotification.Name("ShowExams"), object: nil)
    case 3:
        NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
    default:
        break
    }
    
    }
    
    
    @IBAction func onClickAddedTasks(_ sender: UIControl) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
         NotificationCenter.default.post(name: NSNotification.Name("ShowAddedTasks"), object: nil)
    }
    
    
}

