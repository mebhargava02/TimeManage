//
//  ExamVC.swift
//  SchoolDemo
//
//  Created by CHETUMAC043 on 11/21/17.
//  Copyright © 2017 CHETUMAC043. All rights reserved.
//

import UIKit

class ExamVC: UIViewController {

    @IBOutlet weak var examTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickAddExam(_ sender: UIButton) {
        if let examName = examTextField.text {
            Constant.MyClassConstants.arrayAddExams.append(examName)
            let defaults = UserDefaults.standard
            defaults.set(Constant.MyClassConstants.arrayAddExams, forKey: "ExamData")
            
            // add alert
            
            let alert = UIAlertController(title: "Exam Added", message: "Exam Added Successfully", preferredStyle: .alert)
            
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
