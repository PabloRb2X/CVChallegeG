//
//  MainViewModel.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol: class {
    var personalData: PersonalData? { get }
    var errorMessage: String? { get }
    var dataDidChange: ((MainViewModelProtocol) -> ())? { get set }
    var dataError: ((MainViewModelProtocol) -> ())? { get set }
    init()
    
    func getPersonalData()
}

class MainViewModel: MainViewModelProtocol {
    
    var personalData: PersonalData?{
        didSet{
            self.dataDidChange?(self)
        }
    }
    var dataDidChange: ((MainViewModelProtocol) -> ())?
    
    var errorMessage: String?{
        didSet{
            self.dataError?(self)
        }
    }
    var dataError: ((MainViewModelProtocol) -> ())?
    
    required init(){
    }
    
    func getPersonalData() {
        let serviceManager: ServiceManager = ServiceManager()
        
        serviceManager.performPersonalDataService()
        serviceManager.onSuccessPersonalDataService = {[weak self](_ response: PersonalData) -> Void in
            
            self?.personalData = response
        }
        serviceManager.onServiceError = {[weak self] (_ message: String) -> Void in
            
            self?.errorMessage = message
        }
    }
    
}
