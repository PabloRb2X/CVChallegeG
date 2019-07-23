//
//  MockApiClient.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/22/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol MockApiClientProtocol {
    
    func personalDataService(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void)
    func personalDataServiceURL(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void)
    func personalDataServiceSession(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void)
}

class MockApiClient{
    var shouldReturnError = false
    var personalDataWasCalled = false
    
    let personalData: PersonalData = PersonalData(name: "", lastName: "", profile: "", age: 0, description: "", jobs: [Job](), schoolName: "", city: "", telephone: 0, email: "", image: "", backgroundImage: "")
    
    enum MockServiceError: Error{
        case personalData
    }
    
    func reset(){
        shouldReturnError = false
        personalDataWasCalled = false
    }
    
    convenience init(){
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool){
        self.shouldReturnError = shouldReturnError
    }
    
}

extension MockApiClient: MockApiClientProtocol{
    
    func personalDataService(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void) {
        personalDataWasCalled = true
        
        if shouldReturnError{
            
            completionHandler(nil, .genericError)
        }
        else{
            
            completionHandler(personalData, nil)
        }
    }
    
    func personalDataServiceURL(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void) {
        
        if let _ = URL(string: urlString){
            
            completionHandler(personalData, nil)
        }
        else{
            
            completionHandler(nil, .genericError)
        }
    }
    
    func personalDataServiceSession(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void) {
        guard let url = URL(string: urlString) else{
            completionHandler(nil, .genericError)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 60.0
        
        let urlSession = URLSession(configuration: configuration)
        
        let dataTask = urlSession.dataTask(with: urlRequest){ data, response, error in
            
            guard let _ = data, error == nil else{
                completionHandler(nil, .genericError)
                return
            }
            
            completionHandler(self.personalData, nil)
        }
        dataTask.resume()
    }
}
