//
//  FirstSearchViewController.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 03/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class FirstSearchViewController: UIViewController {
    var firstSearchVacancyName = ""
    var firstSearchvacancyArea = ""

    @IBOutlet weak var vacancyNameSearchText: UITextField!
    @IBOutlet weak var vacancyCitySearchText: UITextField!
    
    @IBAction func firstSearchButton(_ sender: Any) {
         performSegue(withIdentifier: "firstSearchSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        vacancyNameSearchText.text = firstSearchVacancyName
        vacancyCitySearchText.text = firstSearchvacancyArea
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSearchSegue" {
            let nav = segue.destination as! UINavigationController
                let dvc = nav.topViewController as! TableViewController
            dvc.vacancyName = vacancyNameSearchText.text!
            dvc.vacancyArea = vacancyCitySearchText.text!
            }
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


