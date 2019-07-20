//
//  MainPresenter.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/20/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol MainView: class {
    
    func setupView(personalData: PersonalData?)
    func showErrorMessage(message: String)
    func showProfessionalExperience()
}

class MainPresenter{
    
    fileprivate var personalData: PersonalData?
    fileprivate var jobs: [Job]?
    
    weak fileprivate var mainView: MainView?
    
    init() { }
    
    func attachView(_ view: MainView){
        mainView = view
    }
    
    func detachView(){
        mainView = nil
    }
    
    func getPersonalData(){
        let serviceManager: ServiceManager = ServiceManager()
        
        if let apiURL = Bundle.main.infoDictionary?["API_URL"] as? String{
            serviceManager.onSuccessPersonalDataService = {[weak self](_ response: PersonalData) -> Void in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self?.personalData = response
                    self?.mainView?.setupView(personalData: self?.personalData)
                })
            }
            serviceManager.onServiceError = {[weak self] (_ message: String) -> Void in
                
                self?.mainView?.showErrorMessage(message: message)
            }
            serviceManager.performService(urlString: apiURL)
        }
    }
    
    func setJobs(){
        
        jobs = personalData?.jobs
        mainView?.showProfessionalExperience()
    }
    
    func getJobs() -> [Job]{
        
        return jobs ?? [Job]()
    }
}
