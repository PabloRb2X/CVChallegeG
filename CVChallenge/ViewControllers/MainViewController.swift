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
}
