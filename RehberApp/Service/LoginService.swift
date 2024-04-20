//
//  LoginService.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

protocol LoginService{
    func getLoginDetails(userName:String,
                         completionHandler: @escaping (LoginDetailModel?, NetworkError?) -> ())
}

class DefaultLoginService:LoginService{
    func getLoginDetails(userName: String,
                         completionHandler: @escaping (LoginDetailModel?, NetworkError?) -> ()) {
        
        let loader = NetworkLoader<[LoginDetailModel]>(fileName: "login")
        
        loader.loadAPIRequest { data, error in
            if let apiData = data {
                if let index = apiData.firstIndex(where: {userName.lowercased() == $0.userName.lowercased() }){
                    completionHandler(apiData[index],nil)
                }else{
                    let error = NetworkError(errorCode: 1,
                                         message: "User not found")
                    completionHandler(nil, error)
                }
            }else{
                completionHandler(nil,error)
            }
        }
    }
}
