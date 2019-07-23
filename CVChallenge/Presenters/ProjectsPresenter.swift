//
//  ProjectsPresenter.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/19/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol ProjectsView: class {
    
    func setProjects(projects: [Project])
}

class ProjectsPresenter{
    
    fileprivate var projects: [Project]?
    weak fileprivate var projectsView: ProjectsView?
    
    init(projects: [Project]) {
        self.projects = projects
    }
    
    func attachView(_ view: ProjectsView){
        projectsView = view
    }
    
    func getProjects(){
        projectsView?.setProjects(projects: projects ?? [Project]())
    }
    
}
