//
//  ProfessionalExperiencePresenter.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/20/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol ProfessionalExperienceView: class {
    
    func initView()
    func setJobs(jobs: [Job])
    func goToProjects()
}

class ProfessionalExperiencePresenter{
    
    fileprivate var jobs: [Job]?
    weak fileprivate var professionalExperienceView: ProfessionalExperienceView?
    
    fileprivate var selectProjects: [Project]?
    
    init(jobs: [Job]) {
        self.jobs = jobs
    }
    
    func attachView(_ view: ProfessionalExperienceView){
        professionalExperienceView = view
    }
    
    func initView(){
        professionalExperienceView?.initView()
    }
    
    func getJobs(){
        professionalExperienceView?.setJobs(jobs: jobs ?? [Job]())
    }
    
    func setProjects(index: Int){
        
        selectProjects = jobs?[index].projects
        professionalExperienceView?.goToProjects()
    }
    
    func getProjects() -> [Project]{
        
        return selectProjects ?? [Project]()
    }
}
