//
//  MainViewController.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var backgroundImageView: UIImageView?
    @IBOutlet weak var photoImageView: UIImageView?
    @IBOutlet weak var stackView: UIStackView?
    @IBOutlet weak var fullNameLabel: UILabel?
    @IBOutlet weak var profileLabel: UILabel?
    @IBOutlet weak var schoolLabel: UILabel?
    @IBOutlet weak var cityLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var textDescriptionLabel: UILabel?
    @IBOutlet weak var contactLabel: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var textPhoneLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?
    @IBOutlet weak var textEmailLabel: UILabel?
    @IBOutlet weak var showProfExpButton: UIButton?
    
    var viewModel: MainViewModelProtocol! {
        didSet{
            self.viewModel.dataDidChange = { [unowned self] viewModel in
                self.dismissLoadingView()
                DispatchQueue.main.async {
                    self.backgroundImageView?.downloadImage(from: viewModel.personalData?.backgroundImage ?? "")
                    self.photoImageView?.downloadImage(from: viewModel.personalData?.image ?? "")
                    self.fullNameLabel?.text = "\(String(describing: viewModel.personalData?.name ?? "")) \(String(describing: viewModel.personalData?.lastName ?? ""))"
                    self.profileLabel?.text = viewModel.personalData?.profile ?? ""
                    self.schoolLabel?.text = viewModel.personalData?.education.schoolName ?? ""
                    self.cityLabel?.text = viewModel.personalData?.direction.city ?? ""
                    self.textDescriptionLabel?.text = self.viewModel.personalData?.description ?? ""
                    self.textPhoneLabel?.text = String(viewModel.personalData?.telephone ?? 0)
                    self.textEmailLabel?.text = viewModel.personalData?.email ?? ""
                    
                    self.setScrollViewContentSize()
                }
            }
            self.viewModel.dataError = { [unowned self] viewModel in
                self.dismissLoadingView()
                self.showErrorAlert(errorMessage: viewModel.errorMessage ?? "", reference: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView?.layer.borderColor = UIColor.black.cgColor
        photoImageView?.layer.borderWidth = 1
        
        self.title = NSLocalizedString("My CV", comment: "")
        
        self.showLoadingView()
        viewModel.getPersonalData()
    }
    
    @IBAction func showProfessionalProfileEvent(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "profExperienceSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ProfessionalExperienceViewController{
            
            viewController.viewModel = ProfessionalExperienceViewModel()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        setScrollViewContentSize()
    }
    
    func calculateSizeScrollView() -> CGFloat{
        
        var height: CGFloat = 0.0
        height += (backgroundImageView?.frame.height ?? 0.0)
        height += (stackView?.frame.height ?? 0.0)
        height += (descriptionLabel?.frame.height ?? 0.0)
        height += (textDescriptionLabel?.frame.height ?? 0.0)
        height += (contactLabel?.frame.height ?? 0.0)
        height += (phoneLabel?.frame.height ?? 0.0)
        height += (textPhoneLabel?.frame.height ?? 0.0)
        height += (emailLabel?.frame.height ?? 0.0)
        height += (textEmailLabel?.frame.height ?? 0.0)
        height += (showProfExpButton?.frame.height ?? 0.0)
        height += ((photoImageView?.frame.height ?? 0.0) + 50.0 - (backgroundImageView?.frame.height ?? 0.0))
        height += 169.0
        
        return height
    }
    
    func setScrollViewContentSize(){
        scrollView?.contentSize = CGSize(width: scrollView?.frame.width ?? 0, height: calculateSizeScrollView())
    }
    
}
