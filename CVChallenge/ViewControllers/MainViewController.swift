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
    
    var mainPresenter: MainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.showLoadingView()
        mainPresenter?.attachView(self)
        mainPresenter?.getPersonalData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        mainPresenter?.detachView()
    }
    
    @IBAction func showProfessionalProfileEvent(_ sender: UIButton) {
        
        mainPresenter?.setJobs()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ProfessionalExperienceViewController{
            
            viewController.professionalExperiencePresenter = ProfessionalExperiencePresenter(jobs: mainPresenter?.getJobs() ?? [Job]())
        }
    }
}

extension MainViewController: MainView{
    func setupView(personalData: PersonalData?) {
        self.dismissLoadingView()
        
        DispatchQueue.main.async {
            self.backgroundImageView?.downloadImage(from: personalData?.backgroundImage ?? "")
            self.photoImageView?.downloadImage(from: personalData?.image ?? "")
            self.fullNameLabel?.text = "\(String(describing: personalData?.name ?? "")) \(String(describing: personalData?.lastName ?? ""))"
            self.profileLabel?.text = personalData?.profile
            self.schoolLabel?.text = personalData?.schoolName
            self.cityLabel?.text = personalData?.city
            self.textDescriptionLabel?.text = personalData?.description
            self.textPhoneLabel?.text = String(personalData?.telephone ?? 0)
            self.textEmailLabel?.text = personalData?.email
        }
    }
    
    func showErrorMessage(message: String) {
        
        self.dismissLoadingView()
        self.showErrorAlert(errorMessage: message, reference: self)
    }
    
    func showProfessionalExperience(){
        
        self.performSegue(withIdentifier: "profExperienceSegue", sender: nil)
    }
    
}
