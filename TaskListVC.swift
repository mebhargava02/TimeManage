//
//  TaskListVC.swift
//  SchoolDemo
//
//  Created by CHETUMAC043 on 11/21/17.
//  Copyright © 2017 CHETUMAC043. All rights reserved.
//

import UIKit

class TaskListVC: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onClickAddTask(_ sender: UIButton) {
        if let taskName = taskTextField.text {
            Constant.MyClassConstants.arrayAddTasks.append(taskName)
            let defaults = UserDefaults.standard
            defaults.set(Constant.MyClassConstants.arrayAddTasks, forKey: "TaskData")
            
            // add alert
            
            let alert = UIAlertController(title: "Task Added", message: "Task Added Successfully", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Ok Clicked")
            }))
            
            present(alert, animated: true, completion: nil)
        }
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
