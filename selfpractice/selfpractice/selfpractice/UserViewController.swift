//
//  UserViewController.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 24/3/22.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var user:User!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = user.name
        cityLabel.text = user.city
        imageView.image = user.image
        
        imageView.layer.borderWidth = 3.0
        
        if user.gender == .male {
            imageView.layer.borderColor = UIColor.black.cgColor
        }else{
            imageView.layer.borderColor = UIColor.red.cgColor
        }
    }
    

    
}
