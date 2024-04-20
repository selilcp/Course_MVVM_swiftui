//
//  LoginViewModel.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

class LoginViewModel{
    
    private var loginDetails:LoginDetailModel?
    private let service: LoginService
    
    init (service: LoginService) {
        self.service = service
    }
    
    func fetchDetails(userName:String,
                      response:@escaping (NetworkError?) -> ()){
        service.getLoginDetails(userName: userName) { [weak self]  details, error in
            if let loginDetails = details{
                self?.loginDetails = loginDetails
                response(nil)
            }else if let error = error{
                response(error)
            }
        }
    }
    
    func getIntrestedList() -> [String] {
        return loginDetails?.intrestedTopics ?? []
    }
    
    func getPreviouslySelectedList() -> [String] {
        return loginDetails?.previouslySelectedTopics ?? []
    }
}
