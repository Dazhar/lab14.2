//
//  TableViewController.swift
//  lab14
//
//  Created by Даня Жариков on 02.10.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import UIKit
import RealmSwift
class TableViewController: UITableViewController {
 //   let realm =  try! Realm()Т
 //   var arr2 = Udef.share.al()d
    var arr3 = Udef.share.item
   // var arr3:Results<toDo>?
    override func viewWillAppear(_ animated: Bool) {
        
        print("yyy")
      //  print(arr2)
        print(Udef.share.item)
        //print("ooo")
      //  print(arr2)
        super.viewWillAppear(animated)
      //  tableView.reloadData()
    }
    @IBAction func but(_ sender: Any) {
        let alert = UIAlertController(title: "изменить", message: "Измените эту задачу", preferredStyle: .alert)
               let save = UIAlertAction(title: "Сохранить", style: .default) { action in
                   let tf = alert.textFields?.first
                   if let new = tf?.text{
                       //self.tasks.insert(new, at: 0)
                    let buttonPosition:CGPoint = (sender as AnyObject).convert(CGPoint.init(x: 5.0, y: 5.0), to:self.tableView)
                    let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
                    var curTask = self.arr3[indexPath?.row ?? 0]
                    Udef.share.updateTask(editTask: curTask , newTask: new)
                    self.tableView.reloadData()

                   // Udef.share.edit(stri:new, ind: indexPath?.row ?? 1)
                       //self.tableView.reloadData()
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
     
        let loader = Udef()
        loader.delegate = self
        loaded(cat: Udef.share.item)
        print("wow2")
             print(arr3)
        
        
        

        print("arr2")

    //    print(arr2)
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
        return arr3.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let currentItem = arr3[indexPath.row]
        cell.Label.text = currentItem.name as? String
        
       /* if(currentItem["IsCom"] as? Bool) == true{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }*/
        
       
        // Configure the cell...

        return cell
    }
/*    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Udef.share.changeCheck(to: (arr3[indexPath.row]))
        
    }
 */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Udef.share.delet(indo: indexPath.row)
            arr3 = Udef.share.item
          //  arr3.remove(at: indexPath.row)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController2, segue.identifier == "seg"{
            vc.delegat = self
        }
    }

}
extension TableViewController: loadDelegate{
    func loaded(cat: Results<toDo>){
        self.arr3 = cat
        print("wow1")
        print(arr3)
        tableView.reloadData()
    }
}
