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
        
        loader.loadAPIRequest {[weak self] data, error in
            if let networkData = data {
                let sortedData = self?.sortWithPriority(list: networkData)
                completionHandler(sortedData,nil)
            }else{
                completionHandler(nil,error)
            }
        }
    }
    
    private func sortWithPriority( list: [CourseModel]) -> [CourseModel]{
        let favList = userFavCategories
        let selectList = alreadySelectedCategories
        var finalList:[CourseModel] = []
        let sortedList = list.sorted(by: {$0.userCount > $1.userCount})
        finalList = sortedList.filter({favList.contains($0.category)})
        let favRemovedList = sortedList.filter({!favList.contains($0.category)})
        let selectedCategoryList = favRemovedList.filter({selectList.contains($0.category)})
        finalList.append(contentsOf: selectedCategoryList)
        let otherList = favRemovedList.filter({!selectList.contains($0.category)})
        finalList.append(contentsOf: otherList)
        return finalList
    }
}
