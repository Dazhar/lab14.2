//
//  TableViewController2.swift
//  lab14
//
//  Created by Даня Жариков on 02.10.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import UIKit
import CoreData

class TableViewController2: UITableViewController {
    var tasks:[ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "Добавить задачу", message: "добавьте новую задачу", preferredStyle: .alert)
        let save = UIAlertAction(title: "Сохранить", style: .default) { action in
            let tf = alert.textFields?.first
            if let new = tf?.text{
                //self.tasks.insert(new, at: 0)
                self.sav(title: new)
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
    
    func sav(title:String){
        var appDel = UIApplication.shared.delegate as! AppDelegate
        var context = appDel.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "ToDo", in: context) else {return}
        let Tobjc = ToDo(entity: entity, insertInto: context)
        Tobjc.name = title
        do{
            try context.save()
            tasks.append(Tobjc)
        }
        catch let error as NSError{
            print("Finito")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var appDel = UIApplication.shared.delegate as! AppDelegate
        var context = appDel.persistentContainer.viewContext
        let fetchReque:NSFetchRequest<ToDo> = ToDo.fetchRequest()
        
        do{
            tasks = try context.fetch(fetchReque)
        }
        catch let error as NSError{
            print("Finito")
        }
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.label2.text = tasks[indexPath.row].name

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete{
            var appDel = UIApplication.shared.delegate as! AppDelegate
                   var context = appDel.persistentContainer.viewContext
                   let fetchReque:NSFetchRequest<ToDo> = ToDo.fetchRequest()
            if let tasks2 = try? context.fetch(fetchReque){
            context.delete(tasks2[indexPath.row])
            }
            do{
                try context.save()
               
            }
            catch let error as NSError{
                print("Finito")
            }
            tasks.remove(at: indexPath.row)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
