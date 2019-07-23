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
            periodLabel?.text = "\(NSLocalizedString("to", comment: "")): \(String(describing: job?.admissionDate ?? "")) - \(String(describing: job?.termDate ?? ""))."
            jobLabel?.text = "\(NSLocalizedString("position", comment: "")): \(String(describing: job?.position ?? ""))"
            descriptionLabel?.text = "\(NSLocalizedString("functions", comment: "")): \(String(describing: job?.summary ?? ""))"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.isAccessibilityElement = true
//        self.accessibilityIdentifier = "profExpCell"
        
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
        
        if let containerView = containerView, let backgroundImageView = backgroundImageView, let companyImageView = companyImageView, let nameCompanyLabel = nameCompanyLabel, let periodLabel = periodLabel, let jobLabel = jobLabel, let descriptionLabel = descriptionLabel, let showProjectsButton = showProjectsButton{
            
            NSLayoutConstraint.activate([
                backgroundImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                backgroundImageView.heightAnchor.constraint(equalToConstant: 70),
                
                companyImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
                companyImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
                companyImageView.widthAnchor.constraint(equalToConstant: 70),
                companyImageView.heightAnchor.constraint(equalToConstant: 70),
                
                nameCompanyLabel.topAnchor.constraint(equalTo: companyImageView.bottomAnchor, constant: 8),
                nameCompanyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                nameCompanyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                
                periodLabel.topAnchor.constraint(equalTo: nameCompanyLabel.bottomAnchor, constant: 8),
                periodLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                periodLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                
                jobLabel.topAnchor.constraint(equalTo: periodLabel.bottomAnchor, constant: 8),
                jobLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                jobLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                
                descriptionLabel.topAnchor.constraint(equalTo: jobLabel.bottomAnchor, constant: 8),
                descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                
                showProjectsButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
                showProjectsButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
                showProjectsButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
                showProjectsButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
}
