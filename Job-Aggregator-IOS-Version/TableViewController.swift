//
//  TableViewController.swift
//  
//
//  Created by Александр Сахнюков on 04/08/2018.
//

import UIKit
import Alamofire
import SafariServices



class TableViewController: UITableViewController,EditViewControllerDelagate {

var vacancyList = Array<Vacancy>()
var vacancyName = "1"
var vacancyArea = "2"
var vacancySalaryTo = "3"
var vacancySalaryFrom = "4"

    @IBOutlet weak var currientVacancySearch: UITextField!
    @IBAction func EditSearchButton(_ sender: Any) {
           performSegue(withIdentifier: "editSearchSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        currientVacancySearch.text = vacancyName

        let vacancy = Vacancy(id: 1, name: self.vacancyName, area: vacancyArea, url: "https://hh.ru/vacancy/26725000", salaryTo: vacancySalaryTo, salaryFrom: vacancySalaryFrom, currency: "r")
        self.vacancyList.append(vacancy)
        print("Жопа \(vacancyList)")
        self.tableView.reloadData()
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
        // #warning Incomplete implementation, return the number of rows
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vacancyCell", for: indexPath) as! VacancyTableViewCell
        let cellItem = vacancyList[indexPath.row]
        cell.vacancyNameCell.text = cellItem.name
        cell.vacancyAreaCell.text = cellItem.area
        return cell
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        vacancyList.removeAll()
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
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
            dvc.delage = self
        }

    }
    func fillTheLablesWith(info: Array<String>) {
      vacancyName = info[0]
      vacancyArea = info[1]
        vacancySalaryTo = info[2]
        vacancySalaryFrom = info[3]
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        
    }
}
