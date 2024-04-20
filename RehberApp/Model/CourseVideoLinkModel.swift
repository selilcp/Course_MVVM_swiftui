//
//  CourseVideoLinkModel.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

struct CourseVideoLinkModel: Codable, Identifiable{
    let id:Int
    let title: String
    let link: String
}
