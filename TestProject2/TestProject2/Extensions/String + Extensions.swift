//
//  String + Extensions.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 30/5/22.
//

import Foundation

extension String{
    func isValid() -> Bool {
        let format =  "SELF MATCHES %@"
        let regEx = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format,regEx).evaluate(with: self)
    }
}
