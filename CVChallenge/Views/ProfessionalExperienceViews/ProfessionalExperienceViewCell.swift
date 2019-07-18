//
//  ProfessionalExperienceViewCell.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/10/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

class ProfessionalExperienceViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var backgroundImageView: UIImageView?
    @IBOutlet weak var companyImageView: UIImageView?
    @IBOutlet weak var nameCompanyLabel: UILabel?
    @IBOutlet weak var periodLabel: UILabel?
    @IBOutlet weak var jobLabel: UILabel?
    
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var showProjectsButton: UIButton?
    
    var job: Job?{
        didSet{
            backgroundImageView?.downloadImage(from: job?.backgroundImage ?? "")
            companyImageView?.downloadImage(from: job?.companyImage ?? "")
            nameCompanyLabel?.text = job?.companyName
            periodLabel?.text = "\(NSLocalizedString("To", comment: "")): \(String(describing: job?.admissionDate ?? "")) - \(String(describing: job?.termDate ?? ""))."
            jobLabel?.text = "\(NSLocalizedString("Position", comment: "")): \(String(describing: job?.position ?? ""))"
            descriptionLabel?.text = "\(NSLocalizedString("Functions", comment: "")): \(String(describing: job?.summary ?? ""))"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundImageView?.translatesAutoresizingMaskIntoConstraints = false
        companyImageView?.translatesAutoresizingMaskIntoConstraints = false
        nameCompanyLabel?.translatesAutoresizingMaskIntoConstraints = false
        periodLabel?.translatesAutoresizingMaskIntoConstraints = false
        jobLabel?.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        showProjectsButton?.translatesAutoresizingMaskIntoConstraints = false
        
        initConstraints()
    }
    
    func initConstraints(){
        let views: [String: Any?] = [
            "backgroundImageView": backgroundImageView,
            "companyImageView": companyImageView,
            "nameCompanyLabel": nameCompanyLabel,
            "periodLabel": periodLabel,
            "jobLabel": jobLabel,
            "descriptionLabel": descriptionLabel,
            "showProjectsButton": showProjectsButton
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        /// backgroundImageView
        allConstraints += getConstraint(visualFormat: "H:|[backgroundImageView]|", views: views)
        allConstraints += getConstraint(visualFormat: "V:|[backgroundImageView(70)]", views: views)
        
        /// companyImageView
        allConstraints += getConstraint(visualFormat: "H:|-16-[companyImageView(70)]", views: views)
        allConstraints += getConstraint(visualFormat: "V:|-35-[companyImageView(70)]", views: views)
        
        /// nameCompanyLabel
        allConstraints += getConstraint(visualFormat: "H:|-16-[nameCompanyLabel]-16-|", views: views)
        allConstraints += getConstraint(visualFormat: "V:[companyImageView]-8-[nameCompanyLabel]", views: views)
        
        /// periodLabel
        allConstraints += getConstraint(visualFormat: "H:|-16-[periodLabel]-16-|", views: views)
        allConstraints += getConstraint(visualFormat: "V:[nameCompanyLabel]-8-[periodLabel]", views: views)
        
        /// jobLabel
        allConstraints += getConstraint(visualFormat: "H:|-16-[jobLabel]-16-|", views: views)
        allConstraints += getConstraint(visualFormat: "V:[periodLabel]-8-[jobLabel]", views: views)
        
        /// jobLabel
        allConstraints += getConstraint(visualFormat: "H:|-16-[descriptionLabel]-16-|", views: views)
        allConstraints += getConstraint(visualFormat: "V:[jobLabel]-8-[descriptionLabel]", views: views)
        
        /// showProjectsButton
        allConstraints += getConstraint(visualFormat: "H:|-16-[showProjectsButton]-16-|", views: views)
        allConstraints += getConstraint(visualFormat: "V:[showProjectsButton(30)]|", views: views)
        
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
