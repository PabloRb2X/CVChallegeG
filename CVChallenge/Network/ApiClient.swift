//
//  ApiClientProtocol.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/22/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol ApiClientProtocol {
    
    func personalDataService(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void)
}

public class ApiClient{
    
    private func execute(_ urlRequest: URLRequest, completionHandler: @escaping (PersonalData?, ApiError?) -> Void){
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 60.0
        
        let urlSession = URLSession(configuration: configuration)
        
        let dataTask = urlSession.dataTask(with: urlRequest){ data, response, error in
            
            guard let responseStatus = response as? HTTPURLResponse, responseStatus.statusCode == 200 else{
                completionHandler(nil, .httpError)
                return
            }
            
            guard let data = data, error == nil else{
                completionHandler(nil, .genericError)
                return
            }
            
            do{
                let personalData = try JSONDecoder().decode(PersonalData.self, from: data)
                    
                completionHandler(personalData, nil)
            }catch{
                
                completionHandler(nil, .serializingError)
            }
        }
        
        dataTask.resume()
    }
}

extension ApiClient: ApiClientProtocol{
    
    func personalDataService(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void) {
        guard let apiURL = Bundle.main.infoDictionary?[urlString] as? String else {
            completionHandler(nil, .genericError)
            return
        }
        
        guard let url = URL(string: apiURL) else{
            completionHandler(nil, .genericError)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        execute(urlRequest, completionHandler: completionHandler)
    }
}
