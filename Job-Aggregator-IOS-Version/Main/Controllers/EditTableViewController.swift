//
//  EditTableViewController.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 09/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

protocol EditViewControllerDelagate {
    func fillTheLablesWith(info:Array<Any>)
}

class EditTableViewController: UITableViewController {

    
    var vacancyEditName = ""
    var vacancyEditArea = ""
    var vacancyEditSalaryTo:Double = 0
    var vacancyEditSalaryFrom: Double = 0
    var SwitchSalary:Bool = true
 
    var delage: EditViewControllerDelagate?
    
    @IBAction func SaveSearchEditButtno(_ sender: Any) {
        if let salaryMinInt = Double(EditVacancySalaryMin.text!), let salaryMaxInt = Double(EditVacancySalaryMax.text!) {
            let info:[Any] = [EditVacancyName.text!,EditVacancyCity.text!,salaryMaxInt,salaryMinInt,SwitchSalary]
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
        EditVacancySalaryMax.keyboardType = UIKeyboardType.numberPad
    }
      @IBOutlet weak var SwitchButton: UISwitch!
    
    @IBAction func swiftchButton(_ sender: Any) {
        if  SwitchSalary == true {
            SwitchSalary = false
            EditVacancySalaryMin.isEnabled = false
            EditVacancySalaryMax.isEnabled = false
        } else {
            SwitchSalary = true
            EditVacancySalaryMin.isEnabled = true
            EditVacancySalaryMax.isEnabled = true
        }
        reloadInputViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        EditVacancyName.text = vacancyEditName
        EditVacancyCity.text = vacancyEditArea
        EditVacancySalaryMin.text = "\(vacancyEditSalaryFrom)"
        EditVacancySalaryMax.text = "\(vacancyEditSalaryTo)"
        if SwitchSalary == true{
            SwitchButton.setOn (true, animated:false)
        } else { SwitchButton.setOn(false, animated:false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

   

}
