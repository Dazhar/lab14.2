//
//  TableViewController.swift
//  lab14
//
//  Created by Даня Жариков on 02.10.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
 //   let realm =  try! Realm()
    var arr2 = Udef.share.al()
    
    @IBAction func but(_ sender: Any) {
        let alert = UIAlertController(title: "изменить", message: "Измените эту задачу", preferredStyle: .alert)
               let save = UIAlertAction(title: "Сохранить", style: .default) { action in
                   let tf = alert.textFields?.first
                   if let new = tf?.text{
                       //self.tasks.insert(new, at: 0)
                    guard let indexPath = self.tableView.indexPathForSelectedRow else { return }

                    Udef.share.edit(stri:new, ind: indexPath.row)
                       self.tableView.reloadData()
                   }
               }
               alert.addTextField {_ in}
               let cancel = UIAlertAction(title: "Отмена", style: .default) { _ in
               }
               alert.addAction(save)
               alert.addAction(cancel)
               present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("arr2")
print(arr2)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.Label.text = arr2[indexPath.row]
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Udef.share.delet(indo: indexPath.row)
            arr2.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
          
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg"{
              guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let vc = segue.destination as! ViewControllerEdit
            vc.str = arr2[indexPath.row]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   
*/
}
