//
//  PersonalData.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

public struct PersonalData: Decodable {
    let name: String
    let lastName: String
    let profile: String
    let age: Int
    let description: String
    let jobs: [Job]
    let schoolName: String
    let city: String
    let telephone: Int
    let email: String
    let image: String?
    let backgroundImage: String?
}

public struct Job: Decodable {
    let id: Int
    let companyName: String
    let position: String
    let admissionDate: String
    let termDate: String
    let summary: String
    let projects: [Project]
    let companyImage: String
    let backgroundImage: String
}

public struct Project: Decodable {
    let nameApp: String
    let descriptionApp: String
}
