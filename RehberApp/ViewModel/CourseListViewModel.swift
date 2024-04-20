//
//  CourseListViewModel.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

@Observable
class CourseListViewModel {
    
    var courseList:[CourseModel] = []
    private let service: CourseListService
    
    init (service: CourseListService) {
        self.service = service
    }
    
    func fetchCourseList(response:@escaping (NetworkError?) -> ()){
        service.getCourseList { [weak self]  courseList, error in
            if let list = courseList{
                self?.courseList = list
                response(nil)
            }else if let error = error{
                response(error)
            }
        }
    }
}
