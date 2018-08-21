//
//  AboutViewController.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 11/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SafariServices
import RealmSwift


class AboutViewController: UIViewController {
    var vacancy = Vacancy(id: 0, name: "", area: "", url: "", salaryFrom: 0, salaryTo: 0, employer: "", experience: "", description: "")

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
            {
                alertController(title: "Ошибка", message: "Неверный  URL адрес")
               
    }
        }
    }
    
    
    
    @IBAction func saveFavoriteButton(_ sender: Any) {
    let vacancyObj = VacancyRealm()
       vacancyObj.id = vacancy.id
        vacancyObj.area = vacancy.area
         vacancyObj.name = vacancy.name
         vacancyObj.descriptionVacancy = vacancy.description
         vacancyObj.experience = vacancy.experience
         vacancyObj.employer = vacancy.employer
        vacancyObj.salaryFrom = vacancy.salaryFrom
        vacancyObj.salaryTo = vacancy.salaryTo
        vacancyObj.url = vacancy.url
        try!  realm.write({
            realm.add(vacancyObj)
        })
        alertController(title: "Успех", message: "Вы успешно сохранили вакансию")
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 vacancyURL.setTitle(vacancy.url, for: .normal)
        vacancyDescription.text = vacancy.description.htmlToString
        vacancyName.text = vacancy.name
        vacancyArea.text = vacancy.area
        vacancyExp.text = "Опыт: \(vacancy.experience)"
        vacancyEnployer.text = vacancy.employer
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
   
    func alertController(title:String,message:String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        present(ac, animated: true, completion: nil)
        ac.addAction(cancel)
    }
}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
