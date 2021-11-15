//
//  ViewController2.swift
//  lab14
//
//  Created by Даня Жариков on 30.09.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var delegat:loadDelegate?
    @IBOutlet var TF: UITextField!
  
    @IBAction func but(_ sender: Any) {
        Udef.share.nam = TF.text!
        var new = toDo()
        new.name = TF.text!
        new.isCompl = false
        
        Udef.share.add(ad: new)
        var arr4 = Udef.share.item
        delegat?.loaded(cat: arr4 )
        dismiss(animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//Udef.share.al()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

