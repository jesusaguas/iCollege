//
//  NextViewController.swift
//  iCollege
//
//  Created by Aitor Sola on 11/12/2019.
//  Copyright © 2019 Jesus Aguas Acin. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    

    
    
    @IBOutlet weak var DateLabel: UILabel!
    
    
    @IBOutlet weak var textFieldOne: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DateLabel.text = dateString
    }
    

    
    
}
