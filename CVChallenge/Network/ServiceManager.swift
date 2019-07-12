//
//  ServiceManager.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

public class ServiceManager{
    public var onSuccessProfessionalExperienceService:((_ response: [Job]) -> ())?
    public var onSuccessPersonalDataService:((_ response: PersonalData) -> ())?
    public var onServiceError:((_ message: String) -> ())?
    
    public func performProfessionalExperienceService(){
        let jsonUrlString = ConstantsService.professionalExperienceURL.rawValue
        
        guard let url = URL(string: jsonUrlString) else{ return }
        
        runService(serviceId: ConstantsServiceID.professionalExperience, url: url)
    }
    
    public func performPersonalDataService(){
        let jsonUrlString = ConstantsService.personalDataURL.rawValue
        
        guard let url = URL(string: jsonUrlString) else{ return }
        
        runService(serviceId: ConstantsServiceID.personalData, url: url)
    }
    
    func runService(serviceId: ConstantsServiceID, url: URL){
        
        var urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 60
        //config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            /// validar si hay error
            if let error = error{
                print("ocurrió un error: ", error)
                self.onServiceError?(NSLocalizedString("An error occurred in the service request.", comment: ""))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 504{
                    self.onServiceError?(NSLocalizedString("Service request time has been exceeded.", comment: ""))
                    return
                }
            }
            
            guard let data = data else { return }
            
            do{
                switch serviceId{
                case .personalData:
                    let personalData = try JSONDecoder().decode(PersonalData.self, from: data)
                    //print(personalData)
                    
                    self.onSuccessPersonalDataService?(personalData)
                case .professionalExperience:
                    let jobs = try JSONDecoder().decode([Job].self, from: data)
                    //print(jobs)
                    
                    self.onSuccessProfessionalExperienceService?(jobs)
                }
                
            }catch let jsopErr{
                
                print("error serializing json object:", jsopErr)
                self.onServiceError?(NSLocalizedString("Error serializing json object.", comment: ""))
            }
        }
        task.resume()
    }
}
