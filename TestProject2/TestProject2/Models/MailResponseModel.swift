//
//  MailResponseModel.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 10/6/22.
//

import Foundation

struct MailResponseModel: Decodable{
    let result: String
    let reason: String
    let did_you_mean: String?
    let succes: Bool
    
    var reasonDescripiton: String{
        switch reason{
        case "invalid_email":
            return "Specified email is not a valid email address syntax"
        case "invalid_domain":
            return "Domain for email does not exist"
        case "rejected_email":
            return "Email address was rejected by the SMTP server, email does not exist"
        case "accepted_email":
            return "Email address was accepted by the SMTP server"
        case "low_quality":
            return "Email address has quality issues that may make it a risky or low-value address"
        case "low_deliverability":
            return "Email address appears to be deliverable, but deliverability cannot guaranteed"
        case "no_connect":
            return "Could not connect to the SMTP server"
        case "timeout":
            return "SMTP session timed out"
        case "ivalid_SMTP":
            return "SMTP server returned an unexpected/ invalid response"
        case "inavailable_smtp":
            return "SMTP server unavailable to proccess our request"
        case "unexpected_error":
            return "An unexpected error has occured"
        default: return "No data"
        }
    }
}
