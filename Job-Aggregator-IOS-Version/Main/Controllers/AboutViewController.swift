//
//  AboutViewController.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 11/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SafariServices
class AboutViewController: UIViewController {
    var vacancy = Vacancy(id: 0, name: "", area: "", url: "", salaryFrom: 0, salaryTo: 0, employer: "", experience: "", description: "", currency: "")
    
    @IBOutlet weak var vacancyName: UILabel!
    
    @IBOutlet weak var vacancyURL: UIButton!
    @IBOutlet weak var vacancyExp: UILabel!
    @IBOutlet weak var vacancyArea: UILabel!
    @IBOutlet weak var vacancyEnployer: UILabel!
    @IBOutlet weak var vacancyDescription: UITextView!

    @IBAction func vacancyURL(_ sender: Any) {
        if let URL = URL(string: vacancy.url) {
            
            if  UIApplication.shared.canOpenURL(URL) == true {
                let svc = SFSafariViewController(url: URL)
                self.present(svc, animated: true, completion: nil)
            }
            else
            {    let ac = UIAlertController(title: "Ошибка", message: "Неверно введен URL адрес", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                present(ac, animated: true, completion: nil)
                ac.addAction(cancel)
    }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 vacancyURL.setTitle(vacancy.url, for: .normal)
        vacancyDescription.text = vacancy.description
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(vacancy)

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
