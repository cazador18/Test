//
//  NetwrokRequest.swift
//  TestProject2
//
//  Created by Erzhan Kasymov on 10/6/22.
//

import Foundation

class NetwrokRequest{
    static let shared = NetwrokRequest()
    private init() {}
    func requestData (verifiableMail: String, completion: @escaping(Result<Data,Error>) -> Void){
       
        let urlString = "https://api.kickbox.com/v2/verify?email=\(verifiableMail)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                completion(.success(data))

            }
        }
        .resume()
    }
}
