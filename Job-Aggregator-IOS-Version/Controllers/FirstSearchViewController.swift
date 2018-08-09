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
 //   let nameImage = UIImage(named: #imageLiteral(resourceName: "city"))
    let cityImage = UIImage(named: "city.png")
    let galstImage = UIImage(named: "galst.png")
    let sizeСityImage = CGRect( x: 10.0, y: -3.0, width: 21, height: 26)
    let sizeGalstImage = CGRect( x: 15.0, y: -7.0, width: 11, height: 34)
    
    @IBOutlet weak var vacancyNameSearchText: UITextField!
    @IBOutlet weak var vacancyCitySearchText: UITextField!
    
    @IBAction func firstSearchButton(_ sender: Any) {
         performSegue(withIdentifier: "firstSearchSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.vacancyNameSearchText.frame.size.height = 50
        self.vacancyCitySearchText.frame.size.height = 50

        addIcon(textField: vacancyCitySearchText, image: cityImage!, size: sizeСityImage)
        addIcon(textField: vacancyNameSearchText, image: galstImage!, size: sizeGalstImage)


       
        
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
    func addIcon (textField : UITextField, image : UIImage, size:CGRect) {
        let leftImageView =  UIImageView (frame: size)
        let view = UIView (frame: CGRect(x: 0, y: 0, width: 35, height: 20))
       
        leftImageView.image = image
         view.addSubview(leftImageView)
        textField.leftView = view
        textField.leftViewMode = .always
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        vacancyNameSearchText.alpha = 0
        
    }
}
