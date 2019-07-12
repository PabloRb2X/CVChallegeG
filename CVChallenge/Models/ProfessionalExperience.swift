//
//  ProfessionalExperience.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

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
    let references: String?
}
