//
//  ServiceManager.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func performService(urlString: String)
    func setupSession(url: URL)
    func runService(session: URLSession, urlRequest: URLRequest)
}

public class ServiceManager: URLSessionProtocol{
    public var onSuccessPersonalDataService:((_ response: PersonalData) -> ())?
    public var onServiceError:((_ message: String) -> ())?
    
    func performService(urlString: String){
        
        guard let url = URL(string: urlString) else{ return }
        
        setupSession(url: url)
    }
    
    func setupSession(url: URL){
        var urlRequest = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 60
        
        let session = URLSession(configuration: config)
        urlRequest.httpMethod = "GET"
        
        runService(session: session, urlRequest: urlRequest)
    }
    
    func runService(session: URLSession, urlRequest: URLRequest){
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let _ = error{
                self.onServiceError?(NSLocalizedString("error_request", comment: ""))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 504{
                    self.onServiceError?(NSLocalizedString("exceed_error_service", comment: ""))
                    return
                }
            }
            
            guard let data = data else { return }
            
            do{
                let personalData = try JSONDecoder().decode(PersonalData.self, from: data)
                    
                self.onSuccessPersonalDataService?(personalData)
            }catch{
                
                self.onServiceError?(NSLocalizedString("error_serializing", comment: ""))
            }
        }
        task.resume()
    }
}
