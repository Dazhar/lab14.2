//
//  ViewController.swift
//  lab14
//
//  Created by Даня Жариков on 27.04.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   

    @IBOutlet var name3: UITextField!
    @IBOutlet var name1: UITextField!
    @IBOutlet var name2: UITextField!
    override func viewDidLoad() {
           super.viewDidLoad()
    
        print(Udef.share.userName)
      //  Udef.share.al()
           // Do any additional setup after loading the view.
       }
    @IBAction func save(_ sender: Any) {
        Udef.share.userName = name1.text
        Udef.share.userName2 = name2.text
    }
 
    
}

