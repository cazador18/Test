//
//  VerificationButton.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 26/4/22.
//

import Foundation
import UIKit

class VerificationButton: UIButton {
    
    public var isValid = false{
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
        backgroundColor = .white
        setTitle("Verification Button", for: .normal)
        let color = UIColor(ciColor: .black)
        setTitleColor(color, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Book", size: 17)
        isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setNotValidSetting() {
        isEnabled = false
        alpha = 0.5
    }
    private func setValidSetting() {
        isEnabled = true
        alpha = 1
    }
    public func setDefaultSetting(){
        configure()
    }
}

