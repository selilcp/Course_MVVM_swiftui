//
//  CourseDetailViewModel.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

@Observable
class CourseDetailViewModel{
    
    var course:CourseModel
    
    init(course: CourseModel) {
        self.course = course
    }
    
}
