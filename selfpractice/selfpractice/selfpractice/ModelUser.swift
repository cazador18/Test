//
//  ModelUser.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 17/3/22.
//

import Foundation
import UIKit

class ModelUser{
    
    var users = [[User]]()
    init() {
        setup()
    }
    
    func setup(){
        let man1 = User(name: "Erzhan", city: "Cholpon-Ata", image: UIImage(named: "human")!, gender: .male)
        let man2 = User(name: "Ularbek", city: "Cholpon-Ata", image: UIImage(named: "human")!, gender: .male)
        let man3 = User(name: "Beknazar", city: "Cholpon-Ata", image: UIImage(named: "human")!, gender: .male)
        
        let manArray = [man1, man2, man3]
        
        let woman1 = User(name: "Damira", city: "Moscow", image: UIImage(named: "human")!, gender: .female)
        let woman2 = User(name: "Ayzhan", city: "Moscow", image: UIImage(named: "human")!, gender: .female)
        let woman3 = User(name: "Zharkynai", city: "Cholpon-Ata", image: UIImage(named: "human")!, gender: .female)
        let woman4 = User(name: "Aynazik", city: "Cholpon-Ata", image: UIImage(named: "human")!, gender: .female)
       
        let womanArray = [woman1, woman2, woman3, woman4]
        
        users.append(manArray)
        users.append(womanArray)
        
    }
    
}
