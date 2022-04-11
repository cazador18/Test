//
//  PhotoGallery.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 2/2/22.
//

import Foundation
import UIKit
class PhotoGallery
{
    var images = [UIImage]()
    init(){
        setupGallery()
    }
    func setupGallery(){
        for i in 0...5{
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }
    
}
