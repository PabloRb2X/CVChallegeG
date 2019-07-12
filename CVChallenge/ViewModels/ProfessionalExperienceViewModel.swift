//
//  ProfessionalExperienceViewModel.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol ProfessionalExperienceViewModelProtocol: class {
    
    var jobs: [Job]? { get }
    var errorMessage: String? { get }
    var projects: [Project]? { get }
    var jobsDidChange: ((ProfessionalExperienceViewModelProtocol) -> ())? { get set }
    var dataError: ((ProfessionalExperienceViewModelProtocol) -> ())? { get set }
    var showProjects: ((ProfessionalExperienceViewModelProtocol) -> ())? { get set }
    
    var showLoading: ((ProfessionalExperienceViewModelProtocol) -> ())? { get set }
    
    init()
    
    func getProfessionalExperience()
    func setProjects(index: Int)
}

class ProfessionalExperienceViewModel: ProfessionalExperienceViewModelProtocol {
    
    var jobs: [Job]?{
        didSet{
            self.jobsDidChange?(self)
        }
    }
    var jobsDidChange: ((ProfessionalExperienceViewModelProtocol) -> ())?
    
    var errorMessage: String?{
        didSet{
            self.dataError?(self)
        }
    }
    var dataError: ((ProfessionalExperienceViewModelProtocol) -> ())?
    
    var projects: [Project]?{
        didSet{
            self.showProjects?(self)
        }
    }
    var showProjects: ((ProfessionalExperienceViewModelProtocol) -> ())?
    
    var showLoading: ((ProfessionalExperienceViewModelProtocol) -> ())?
    
    required init(){ }
    
    func getProfessionalExperience() {
        if jobs?.count == nil{
            self.showLoading?(self)
            
            let serviceManager: ServiceManager = ServiceManager()
            
            serviceManager.performProfessionalExperienceService()
            serviceManager.onSuccessProfessionalExperienceService = {[weak self](_ response: [Job]) -> Void in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self?.jobs = response
                }
            }
            serviceManager.onServiceError = {[weak self] (_ message: String) -> Void in
                
                self?.errorMessage = message
            }
        }
    }
    
    func setProjects(index: Int){
        
        self.projects = jobs?[index].projects
    }
}
