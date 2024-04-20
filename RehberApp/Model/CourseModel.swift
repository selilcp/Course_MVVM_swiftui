//
//  CourseModel.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

struct CourseModel: Codable{
    let id:Int
    let title: String
    let instructorName: String
    let category:String
    let shortDescription: String
    let description: String
    let userCount:Int
    let videoLinks: [String]
}
