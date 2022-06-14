//
//  UIStackView + Extensions.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 18/4/22.
//

import Foundation
import UIKit

extension UIStackView{
    convenience init(arrangedSubviews:[UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat){
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
