//
//  CourseListService.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

protocol CourseListService{
    func getCourseList(completionHandler: @escaping ([CourseModel]?, NetworkError?) -> ())
}

class DefaultCourseListService:CourseListService{
    
    private let userFavCategories:[String]
    private let alreadySelectedCategories: [String]
    
    init(userFavCategories: [String],
         alreadySelectedCategories: [String]) {
        self.userFavCategories = userFavCategories
        self.alreadySelectedCategories = alreadySelectedCategories
    }
    
    func getCourseList(completionHandler: @escaping ([CourseModel]?, NetworkError?) -> ()) {
        
        let loader = NetworkLoader<[CourseModel]>(fileName: "courseList")
        
        loader.loadAPIRequest { data, error in
            if let apiData = data {
                completionHandler(apiData,nil)
            }else{
                completionHandler(nil,error)
            }
        }
    }
}
