//
//  NetworkDataFetch.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 10/6/22.
//

import Foundation

class NetworkDataFetch{
    static let shared = NetworkDataFetch()
    private init () {}
    
    func fetchMail(verifiableMail: String, response: @escaping(MailResponseModel?, Error?) -> Void){
        NetwrokRequest.shared.requestData(verifiableMail: verifiableMail) { result in
            switch result{
            case .success(let data):
                do {
                    let mail = try JSONDecoder().decode(MailResponseModel.self, from: data)
                    response(mail,nil)
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response (nil, error)
            }
        }
    }
}
