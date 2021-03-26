//
//  ApiRequest.swift
//  ApiRest
//
//  Created by Jorge Pinedo on 6/3/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import Foundation

enum APIError:Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest {
    let resourceURL:URL
    
    init(endpoint:String){
        let resourceString = "http://localhost:3000"
        guard let resourceURL=URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func save(_ messageToSave:Message, comletionHandler: @escaping (NSArray?) -> Void){
//        do{
//            var urlRequest = URLRequest(url: resourceURL)
//            urlRequest.httpMethod="POST"
//            urlRequest.addValue("application/json",forHTTPHeaderField: "Content-type")
//            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
//            
//            let dataTask = URLSession.shared.dataTask(with: urlRequest){ data,response, _ in
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else{
//                    completion( .failure(.responseProblem))
//                    return
//                }
//                
//                do{
//                    let messageData = try JSONDecoder().decode(Message.self, from: jsonData)
//                    completion(.success(messageData))
//                }catch{
//                    completion(.failure(.decodingProblem))
//                }
//                
//            }
//            dataTask.resume()
//        }catch{
//            completion(.failure(.encodingProblem))
//        }
    }

}
