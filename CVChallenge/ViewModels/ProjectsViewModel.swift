//
//  ProjectsViewModel.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/10/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

protocol ProjectsViewModelProtocol: class {
    
    var projects: [Project]? { get }
    var projectsDidChange: ((ProjectsViewModelProtocol) -> ())? { get set }
    init(projects: [Project])
    
}

class ProjectsViewModel: ProjectsViewModelProtocol {
    
    var projects: [Project]?{
        didSet{
            //self.projectsDidChange?(self)
        }
    }
    var projectsDidChange: ((ProjectsViewModelProtocol) -> ())?
    
    required init(projects: [Project]) {
        
        self.projects = projects
    }
}
