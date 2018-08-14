//
//  FavoriteTableViewController.swift
//  Job-Aggregator-IOS-Version
//
//  Created by Александр Сахнюков on 11/08/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteTableViewController: UITableViewController {
    var vacancyRealmList: Results<VacancyRealm>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   print("Жопа  \(vacancyRealmList)")
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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
        return vacancyRealmList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteVacancyCell", for: indexPath) as! FavoriteTableViewCell
        let cellItem = vacancyRealmList[indexPath.row]
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
            //   if cellItem.salaryTo != 0 {
            cell.vacancyMaxCell.text = "До \(NSString(format: "%.0f", cellItem.salaryTo))"
            //  } else {
            //       cell.vacancyMaxCell.alpha = 0
            
            //    }
        }
        return cell
    }
 
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            let item = self.vacancyRealmList[indexPath.row]
            try! realm.write({
                realm.delete(item)
            })
            
            tableView.deleteRows(at:[indexPath], with: .middle)
            self.tableView.reloadData()
            
        }
        delete.backgroundColor = #colorLiteral(red: 0.5474103281, green: 0.06319656619, blue: 0.001554360255, alpha: 1)
        return [delete]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Жопа  \(vacancyRealmList)")
        self.tableView.reloadData()
        
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

}
