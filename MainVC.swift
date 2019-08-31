//
//  MainVC.swift
//  Organise 1
//
//  Created by MEHUL BHARGAVA on 04/11/17.
//  Copyright © 2017 MEHUL BHARGAVA. All rights reserved.
//

import UIKit
import UserNotifications

class MainVC: UIViewController {
   
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var classTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let defaults = UserDefaults.standard
        var arrayClasses = defaults.object(forKey: "date")
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showClasses),
                                               name: NSNotification.Name("ShowClasses"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showTasks),
                                               name: NSNotification.Name("ShowTasks"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showExams),
                                               name: NSNotification.Name("ShowExams"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showSettings),
                                               name: NSNotification.Name("ShowSettings"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showAddedTasks),
                                               name: NSNotification.Name("ShowAddedTasks"),
                                               object: nil)
    }
    
    @objc func showClasses() {
        Constant.MyClassConstants.isAddClassesclicked = true
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    @objc func showTasks() {
        performSegue(withIdentifier: "ShowTasks", sender: nil)
    }
    
    @objc func showExams() {
        performSegue(withIdentifier: "ShowExams", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @objc func showAddedTasks() {
        performSegue(withIdentifier: "ShowAddedTasks", sender: nil)
    }
    
    @IBAction func onMoreTapped() {
        Constant.MyClassConstants.isAddClassesclicked = false
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    @IBAction func onClickAddClasses(_ sender: UIButton) {
        if let className = classTextField.text {
            Constant.MyClassConstants.arrayAddClasses.append(className)
            let defaults = UserDefaults.standard
            defaults.set(Constant.MyClassConstants.arrayAddClasses, forKey: "ClassesData")
            
            // add alert
            
            let alert = UIAlertController(title: "Class Added", message: "Class Added Successfully", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Ok Clicked")
            }))
            
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        // this functionality is not used yet
        let date = datePicker.date
        
        //convert date to string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss a"
        let dateStr = dateFormatter.string(from: date as Date)
        print("new date string from date \(dateStr)")
        
        //convert string to date
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm:ss a"
        
        if let newDate = dateFormatter.date(from: dateStr) {
            print("new date from string is \(newDate)")
        }
        
        let defaults = UserDefaults.standard
        defaults.set(dateStr, forKey: "date")
        
    }
    
}
