//
//  GreenViewController.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 2/2/22.
//

import UIKit

class GreenViewController: UIViewController {
    var textFromVC:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = textFromVC
    }
    

    @IBAction func goToRoot(_ sender: UIButton) {
  
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
}
