//
//  AddedTasksVC.swift
//  SchoolDemo
//
//  Created by CHETUMAC043 on 11/22/17.
//  Copyright © 2017 CHETUMAC043. All rights reserved.
//

import UIKit

class AddedTasksVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}

// MARK: - table view datasource
extension AddedTasksVC:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            let defaults = UserDefaults.standard
            if let arrayClasses = defaults.array(forKey: "ClassesData") {
                if arrayClasses.count > 0 {
                    return arrayClasses.count
                    
                }  else {
                    return 0
                }
            }
          
        case 1:
            let defaults = UserDefaults.standard
            if let arrayTask = defaults.array(forKey: "TaskData") {
                if arrayTask.count > 0 {
                    return arrayTask.count
                }  else {
                    return 0
                }
            }
            
        default:
            let defaults = UserDefaults.standard
            if let arrayExam = defaults.array(forKey: "ExamData") {
                if arrayExam.count > 0 {
                    return arrayExam.count    
                } else {
                    return 0
                }
            }
            
        }
        
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"tableViewCell")
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0: do {
                let defaults = UserDefaults.standard
                let arrayClasses = defaults.array(forKey: "ClassesData")
                cell.textLabel?.text = arrayClasses?[indexPath.row] as? String
            }
            
        case 1: do {
                let defaults = UserDefaults.standard
                let arrayTask  = defaults.array(forKey: "TaskData")
                cell.textLabel?.text = arrayTask?[indexPath.row] as? String
            }
            
        default: do {
            let defaults = UserDefaults.standard
            let arrayExam = defaults.array(forKey: "ExamData")
            cell.textLabel?.text = arrayExam?[indexPath.row] as? String
          
            }
        }
        return cell
    }
    
}

// MARK: - table view datasource
extension AddedTasksVC:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked row = \(indexPath.row) and section = \(indexPath.section)")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        
        let labelHeader = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        switch section {
        case 0:
            labelHeader.text = "Added Classes"
        case 1:
            labelHeader.text = "Added Tasks"
        default:
            labelHeader.text = "Added Exams"
        }
        labelHeader.textColor = UIColor.black
        labelHeader.textAlignment = NSTextAlignment.center
        
        viewHeader.addSubview(labelHeader)
        
        viewHeader.backgroundColor = UIColor.lightGray
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (_, index) -> Void in
            
            switch indexPath.section {
            case 0: do {
                    let defaults = UserDefaults.standard
                    var arrayClasses = defaults.array(forKey: "ClassesData")
                    arrayClasses?.remove(at: indexPath.row)
                    Constant.MyClassConstants.arrayAddClasses = arrayClasses as! [String]
                    defaults.set(arrayClasses, forKey: "ClassesData")
                    defaults.synchronize()
                }
                
            case 1: do {
                    let defaults = UserDefaults.standard
                    var arrayTask  = defaults.array(forKey: "TaskData")
                    arrayTask?.remove(at: indexPath.row)
                    Constant.MyClassConstants.arrayAddTasks = arrayTask as! [String]
                    defaults.set(arrayTask, forKey: "TaskData")
                    defaults.synchronize()
                
                }
                
            default: do {
                    let defaults = UserDefaults.standard
                    var arrayExam = defaults.array(forKey: "ExamData")
                    arrayExam?.remove(at: indexPath.row)
                    Constant.MyClassConstants.arrayAddExams = arrayExam as! [String]
                    defaults.set(arrayExam, forKey: "ExamData")
                    defaults.synchronize()
                
                }
              
            }
            
            tableView.reloadData()
        }
        
        delete.backgroundColor = UIColor(red: 224 / 255.0, green: 96.0 / 255.0, blue: 84.0 / 255.0, alpha: 1.0)
        
        return [delete]
        
        
    }
        
  
}
