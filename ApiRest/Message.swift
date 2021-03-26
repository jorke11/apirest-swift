//
//  Message.swift
//  ApiRest
//
//  Created by Jorge Pinedo on 6/3/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import Foundation

final class Message: Codable {

    var id:Int?
    var message:String
    
    init(message:String){
        self.message = message
    }
    
  
}
