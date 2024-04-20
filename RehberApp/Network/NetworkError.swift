//
//  NetworkError.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

struct NetworkError: Error, Codable, Identifiable{
    
    let id: Int
    let message: String
    
    init(errorCode:Int,
         message:String){
        self.id = errorCode
        self.message = message
    }
}
