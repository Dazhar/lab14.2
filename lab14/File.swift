//
//  File.swift
//  lab14
//
//  Created by Даня Жариков on 27.04.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import Foundation
import RealmSwift

class toDo: Object {
    @objc dynamic var name = ""
    @objc dynamic var isCompl:Bool = Bool()
}

class Udef{
   // var ty = toDo()
    var nam = ""
   var arr:[[String:Any]] = [["Name":String(),"IsCom":Bool()]]
       var arr2:[[String:Any]] = [["Name":String(),"IsCom":Bool()]]
    static let share = Udef()
    private let realm =  try! Realm()
    func add(ad:toDo){
        let realm = try! Realm()

               try! realm.write{

                   realm.add(ad)

               }
       /* let tDo = toDo()
        tDo.name = nam
        tDo.isCompl = false
        try! realm.write{
            realm.add(tDo)
        }
    */
    }
    
    var item: Results<toDo> {

           let realm = try! Realm()

           return realm.objects(toDo.self)

       }
    func changeCheck(Item:Int){
    //   arr[Item]["IsCom"] = !(arr[Item]["IsCom"] as! Bool)
        let allTodo2 = realm.objects(toDo.self)
        print("morgen")
        print(allTodo2[Item]["IsCom"])
      // allTodo2[Item]["IsCom"] = !(allTodo2[Item]["IsCom"] as! Bool)
   
        
    }
    func updateTask(editTask : toDo, newTask: String ) {

        try! realm.write {
            editTask.name = newTask

            //editTask.task = newTask

        }

    }
    
  
    func delet(indo:Int){
        print("ogo")
           let allTodo = realm.objects(toDo.self)
            try! realm.write{
                realm.delete(allTodo[indo])
           }
        print("tt")
        print(allTodo)
       
           }
    private let kUserName = "default.kUserName"
    private let kUserName2 = "default.kUserName2"
    var userName: String?{
        set{UserDefaults.standard.set(newValue, forKey: kUserName)}
        get{return UserDefaults.standard.string(forKey: kUserName)}
    }
    var userName2: String?{
        set{UserDefaults.standard.set(newValue, forKey: kUserName2)}
        get{return UserDefaults.standard.string(forKey: kUserName2)}
    }
}
