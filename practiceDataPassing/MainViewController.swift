//
//  ViewController.swift
//  practiceDataPassing
//
//  Created by 양호준 on 2021/11/07.
//

import UIKit

class MainViewController: UIViewController {
    var text: String = ""

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.text = text
    }
    
    @IBAction func touchUpDataTransmissionButton(_ sender: UIButton) {
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            secondVC.text = textField.text ?? "없습니다"
            
            self.present(secondVC, animated: true)
        }
    }

}

