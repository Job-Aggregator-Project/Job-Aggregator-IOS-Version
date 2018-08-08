//
//  TableViewController.swift
//  
//
//  Created by Александр Сахнюков on 04/08/2018.
//

import UIKit
import Alamofire
import SafariServices
import SwiftyJSON



class TableViewController: UITableViewController,EditViewControllerDelagate,UITextFieldDelegate {

var vacancyList = Array<Vacancy>()


var vacancyName = ""
var vacancyArea = ""
    var vacancySalaryTo: Double = 0
    var vacancySalaryFrom: Double = 0
    var switchSalaryMain:Bool = true
    var SearchPage = 1
    var maxPage = 0
    
    
    @IBOutlet weak var currientVacancySearch: UITextField!
    @IBAction func EditSearchButton(_ sender: Any) {
           performSegue(withIdentifier: "editSearchSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currientVacancySearch.delegate = self
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        currientVacancySearch.text = vacancyName
        fetchJSON(SearchPage: 1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacancyList.count
    }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellItem = vacancyList[indexPath.row]
    if  let URL = URL(string: cellItem.url) {
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
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastitem = vacancyList.count - 1
        if indexPath.row == lastitem {
            
            self.SearchPage = SearchPage + 1
            if  self.SearchPage < self.maxPage { fetchJSON(SearchPage: SearchPage)
            } else {return}
    }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vacancyCell", for: indexPath) as! VacancyTableViewCell
        let cellItem = vacancyList[indexPath.row]
        cell.vacancyNameCell.text = cellItem.name
        cell.vacancyAreaCell.text = cellItem.area
        if cellItem.salaryFrom == 0 && cellItem.salaryTo == 0  {
            cell.vacancyMinCell.text = "Не указана"
            cell.vacancyMaxCell.alpha = 0
        } else {
              if cellItem.salaryFrom != 0  {
                cell.vacancyMinCell.text = "От \(NSString(format: "%.0f", cellItem.salaryFrom))"
            } else {
                cell.vacancyMinCell.alpha = 0
            }
 //           if cellItem.salaryTo != 0 {
                cell.vacancyMaxCell.text = "  До \(NSString(format: "%.0f", cellItem.salaryTo))"
//        } else {
//              cell.vacancyMaxCell.alpha = 0

//            }
             }
        return cell
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        vacancyList.removeAll()
        self.SearchPage = 0
        
    }
    
    // segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToFirstSearchSegue" {
            let dvc = segue.destination as! FirstSearchViewController
            dvc.firstSearchVacancyName = vacancyName
            dvc.firstSearchvacancyArea = vacancyArea
        }
        if segue.identifier == "editSearchSegue" {
            let dvc = segue.destination as! EditViewController
            dvc.vacancyEditName = vacancyName
            dvc.vacancyEditArea = vacancyArea
            dvc.vacancyEditSalaryTo = vacancySalaryTo
            dvc.vacancyEditSalaryFrom = vacancySalaryFrom
            dvc.SwitchSalary = switchSalaryMain
            dvc.delage = self
        }

    }
    

    // delegate func
    
    func fillTheLablesWith(info: Array<Any>) {
      vacancyName = info[0] as! String
      vacancyArea = info[1] as! String
        vacancySalaryTo = info[2] as! Double
        vacancySalaryFrom = info[3] as! Double
        switchSalaryMain = info[4] as! Bool
 
    }


    func textFieldDidEndEditing(_ textField: UITextField) {
        vacancyList.removeAll()
       
        vacancyName = currientVacancySearch.text!
        fetchJSON(SearchPage: 1)
        self.vacancySalaryTo = 0
        self.vacancySalaryFrom = 0
        self.SearchPage = 0

    }
    
    
    
    func fetchJSON (SearchPage:Int) {
        let search = ["name" : vacancyName, "area" : vacancyArea, "page" : SearchPage, "description" : "description"] as [String : Any]
         let queue = DispatchQueue.global(qos: .utility)
         queue.async {
        request("http://jobag.vkzhuk.com/api/vacancies/", method: .get, parameters: search).validate().responseJSON
            { response in
                let json = JSON(response.value as Any)
                let count = json["data"].count
                print(json)
                self.maxPage = json["last_page"].intValue
                for i in 0..<count {
                    self.vacancyList.append(Vacancy(id: json["data",i,"id"].intValue,
                                                    name: json["data",i,"name"].string!,
                                                    area: json["data",i,"area"].string!,
                                                    url: json["data",i,"url"].string!,
                                                    salaryFrom: json["data",i,"salaryFrom"].doubleValue,
                                                    salaryTo: json["data",i,"salaryTo"].doubleValue))
                }
            
                print(self.vacancyList)
                self.tableView.reloadData()
                 self.sortArray()
                self.tableView.reloadData()
                print(self.vacancySalaryFrom,self.vacancySalaryTo)
            }
        }
        DispatchQueue.main.async {
            return
        }
    }
    
  
    
    func sortArray () {

        
        if switchSalaryMain == false {
                return
        } else {
        if switchSalaryMain == true && vacancySalaryTo != 0 {    self.vacancyList = self.vacancyList.filter{$0.salaryFrom >= vacancySalaryFrom
            &&  $0.salaryTo <= vacancySalaryTo && $0.salaryFrom < $0.salaryTo }
            
        }
        else {
            self.vacancyList = self.vacancyList.filter{$0.salaryFrom > vacancySalaryFrom}
            }
        }

    }

}





