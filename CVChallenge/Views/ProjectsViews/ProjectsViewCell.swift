//
//  ProjectsViewCell.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/10/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

class ProjectsViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var projectName: UILabel?
    @IBOutlet weak var projectDescription: UILabel?
    
    var project: Project?{
        didSet{
            projectName?.text = project?.nameApp
            projectDescription?.text = project?.descriptionApp
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        projectName?.translatesAutoresizingMaskIntoConstraints = false
        projectDescription?.translatesAutoresizingMaskIntoConstraints = false
        
        initConstraints()
    }
    
    func initConstraints(){

        if let containerView = containerView, let projectName = projectName, let projectDescription = projectDescription{
            NSLayoutConstraint.activate([
                projectName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
                projectName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                projectName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                
                projectDescription.topAnchor.constraint(equalTo: projectName.bottomAnchor, constant: 0),
                projectDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                projectDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                projectDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 4)
            ])
        }
    }
}
