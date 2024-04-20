//
//  NetworkLoader.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

class NetworkLoader<T: Codable> {
    let fileName:String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func loadAPIRequest(completionHandler: @escaping (T?, NetworkError?) -> ()) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                completionHandler(jsonData,nil)
            } catch {
                let error = NetworkError(errorCode: 500,
                                     message: "Something went wrong")
                completionHandler(nil, error)
            }
        }
    }
}

