//
//  LoginDetailModel.swift
//  RehberApp
//
//  Created by Selil on 20/04/2024.
//

import Foundation

struct LoginDetailModel: Codable {
    let userId:Int
    let name: String
    let userName: String
    let intrestedTopics: [String]
    let previouslySelectedTopics: [String]
}
