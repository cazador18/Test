//
//  StatusLabel.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 12/4/22.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    public var isValid = false {
        didSet {
            if self.isValid{
                setValidSetting()
            } else{
                setNotValidSetting()
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        text = "Check your mail"
        textColor = .white
        font = UIFont(name: "Apple SD Gothic Neo ", size: 30)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSetting() {
        text = "Mail is not valid. Example: name@domain.kg"
        textColor = .red
    }
    private func setValidSetting() {
        text = "Mail is valid"
        textColor = .green
    }
    public func setDefaultSetting(){
        configure()
    }
}
