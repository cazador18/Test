//
//  User.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 17/3/22.
//

import Foundation
import UIKit

enum Gender{
    case male
    case female
}
class User: NSObject{
    var name: String
    var city: String
    var image: UIImage
    var gender: Gender
    init(name:String,city:String,image:UIImage,gender:Gender) {
        self.name = name
        self.image = image
        self.gender = gender
        self.city  = city
    }
}
