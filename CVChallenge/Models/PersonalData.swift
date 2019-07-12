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
    let civilStatus: String
    let description: String
    let direction: Direction
    let education: Education
    let telephone: Int
    let email: String
    let image: String?
    let backgroundImage: String?
}

public struct Direction: Decodable {
    let street: String
    let outdoorNumber: Int
    let interiorNumber: Int?
    let suburb: String
    let town: String
    let city: String
    let postalCode: Int
    let country: String
}

public struct Education: Decodable {
    let educationalLevel: String
    let jobTitle: String
    let schoolName: String
    let period: String
    let status: String
}
