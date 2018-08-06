//
//  EditViewController.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 04/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

protocol EditViewControllerDelagate {
    func fillTheLablesWith(info:Array<Any>)
}



class EditViewController: UIViewController {
    var vacancyEditName = ""
    var vacancyEditArea = ""
    var vacancyEditSalaryTo:Int = 0
    var vacancyEditSalaryFrom: Int = 0
    var SwitchSalary:Bool = true
    
    var delage: EditViewControllerDelagate?
    
    @IBAction func SwitchSalaryButton(_ sender: Any) {
        
        
    }
    @IBAction func SaveSearchEditButtno(_ sender: Any) {
        if let salaryMinInt = Int(EditVacancySalaryMin.text!), let salaryMaxInt = Int(EditVacancySalaryMax.text!) {
            let info:[Any] = [EditVacancyName.text!,EditVacancyCity.text!,salaryMinInt,salaryMaxInt]
            delage?.fillTheLablesWith(info: info)
            navigationController?.popViewController(animated: true)
        }
        }
        
       
    
    @IBOutlet weak var EditVacancyName: UITextField!
    @IBOutlet weak var EditVacancyCity: UITextField!
    @IBOutlet weak var EditVacancySalaryMin: UITextField!
    
    @IBOutlet weak var EditVacancySalaryMax: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EditVacancySalaryMin.keyboardType = UIKeyboardType.numberPad
        EditVacancySalaryMin.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        EditVacancyName.text = vacancyEditName
         EditVacancyCity.text = vacancyEditArea
         EditVacancySalaryMax.text = "\(vacancyEditSalaryFrom)"
         EditVacancySalaryMin.text = "\(vacancyEditSalaryTo)"
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
