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
    var nam = ""
   var arr:[[String:Any]] = [["Name":String(),"IsCom":Bool()]]
       var arr2:[[String:Any]] = [["Name":String(),"IsCom":Bool()]]
    static let share = Udef()
    private let realm =  try! Realm()
    func test(){
        let tDo = toDo()
        tDo.name = nam
        tDo.isCompl = false
        try! realm.write{
            realm.add(tDo)
        }
    
    }
    func al()->[[String:Any]]{
        
        let allTodo = realm.objects(toDo.self)
               for i in allTodo{
                   print(i)
                
                arr.append(["Name":i.name,"IsCom":i.isCompl])
               }
        arr.remove(at: 0)
    return arr
    }
    func changeCheck(Item:Int){
    //   arr[Item]["IsCom"] = !(arr[Item]["IsCom"] as! Bool)
        let allTodo2 = realm.objects(toDo.self)
        print("morgen")
        print(allTodo2[Item]["IsCom"])
      // allTodo2[Item]["IsCom"] = !(allTodo2[Item]["IsCom"] as! Bool)
   
        
    }
    func edit(stri:String,ind:Int){
        print("eee")
        print(stri)
        print(ind)
         let allTodo = realm.objects(toDo.self)
        let SelTodo = allTodo[ind+1]
        SelTodo.name = stri
    }
    func delet(indo:Int){
        print("ogo")
           let allTodo = realm.objects(toDo.self)
            try! realm.write{
                realm.delete(allTodo[indo-1])
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
