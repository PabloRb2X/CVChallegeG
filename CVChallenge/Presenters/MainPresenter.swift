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
    
    func getPersonalData(){

        let apiClient = ApiClient()
        
        apiClient.personalDataService(urlString: Constants.urlId.rawValue) { [weak self] (response, error) in
            
            guard let response = response else{
                if let error = error{
                    
                    self?.mainView?.showErrorMessage(message: error.getTextError())
                }
                
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                
                self?.personalData = response
                self?.mainView?.setupView(personalData: self?.personalData)
            })
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
