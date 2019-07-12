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
        // Initialization code
        containerView?.layer.cornerRadius = 5
        containerView?.layer.shadowColor = UIColor.black.cgColor
        containerView?.layer.shadowOpacity = 0.5
        containerView?.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView?.layer.shadowRadius = 1
        
        projectName?.translatesAutoresizingMaskIntoConstraints = false
        projectDescription?.translatesAutoresizingMaskIntoConstraints = false
        
        initConstraints()
    }
    
    func initConstraints(){
        let views: [String: Any?] = [
            "projectName": self.projectName,
            "projectDescription": self.projectDescription
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        /// projectName
        allConstraints += getConstraint(visualFormat: "H:|-8-[projectName]-8-|", views: views)
        allConstraints += getConstraint(visualFormat: "V:|-8-[projectName]", views: views)
        
        /// projectDescription
        allConstraints += getConstraint(visualFormat: "H:|-8-[projectDescription]-8-|", views: views)
        allConstraints += getConstraint(visualFormat: "V:[projectName]-8-[projectDescription]", views: views)
        NSLayoutConstraint.activate(allConstraints)
    }
    
    func getConstraint(visualFormat: String, views: [String: Any?]) -> [NSLayoutConstraint]{
        let constraint = NSLayoutConstraint.constraints(
            withVisualFormat: visualFormat,
            metrics: nil,
            views: views as [String : Any])
        
        return constraint
    }
    
}
