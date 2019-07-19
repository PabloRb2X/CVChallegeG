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
    var projects: [Project]? { get }
    var showProjects: ((ProfessionalExperienceViewModelProtocol) -> ())? { get set }
    
    init(jobs: [Job])
    
    func setProjects(index: Int)
}

class ProfessionalExperienceViewModel: ProfessionalExperienceViewModelProtocol {
    
    var jobs: [Job]?
    
    var projects: [Project]?{
        didSet{
            self.showProjects?(self)
        }
    }
    var showProjects: ((ProfessionalExperienceViewModelProtocol) -> ())?
    
    required init(jobs: [Job]){
        self.jobs = jobs
    }
    
    func setProjects(index: Int){
        
        self.projects = jobs?[index].projects
    }
}
