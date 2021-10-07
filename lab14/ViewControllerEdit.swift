//
//  ViewControllerEdit.swift
//  lab14
//
//  Created by Даня Жариков on 07.10.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import UIKit

class ViewControllerEdit: UIViewController {
    var str = ""
    @IBOutlet var EditLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EditLabel.text = str
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
