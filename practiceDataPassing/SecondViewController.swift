//
//  ViewController.swift
//  practiceDataPassing
//
//  Created by 양호준 on 2021/11/07.
//

import UIKit

class SecondViewController: UIViewController {
    var text = ""
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textLabel.text = text
    }
}
