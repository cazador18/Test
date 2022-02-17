//
//  SettingsViewController.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 2/2/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func goToGreen(_ sender: UIButton) {
        let newVC = storyboard!.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
        let text =  textField.text
        newVC.textFromVC = text
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    

}
