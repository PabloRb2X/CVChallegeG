//
//  ProfessionalExperienceViewController.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

class ProfessionalExperienceViewController: UIViewController {
    
    @IBOutlet weak var profExpCollectionView: UICollectionView?
    
    var professionalExperiencePresenter: ProfessionalExperiencePresenter?
    fileprivate var jobs: [Job]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profExpCollectionView?.register(UINib(nibName: "ProfessionalExperienceViewCell", bundle: nil), forCellWithReuseIdentifier: "profExpCell")
        
        professionalExperiencePresenter?.attachView(self)
        professionalExperiencePresenter?.getJobs()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        professionalExperiencePresenter?.detachView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ProjectsViewController{
            
            viewController.projectsPresenter = ProjectsPresenter(projects: professionalExperiencePresenter?.getProjects() ?? [Project]())
        }
    }
    
    @IBAction func backEvent(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
}

extension ProfessionalExperienceViewController: ProfessionalExperienceView{
    
    func setJobs(jobs: [Job]) {
        
        self.jobs = jobs
        profExpCollectionView?.reloadData()
    }
    
    func goToProjects(){
        
        self.performSegue(withIdentifier: "projectsSegue", sender: nil)
    }
}

extension ProfessionalExperienceViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        professionalExperiencePresenter?.setProjects(index: indexPath.row)
    }
}

extension ProfessionalExperienceViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return jobs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profExpCell", for: indexPath) as? ProfessionalExperienceViewCell else{
            return UICollectionViewCell()
        }
        
        cell.job = jobs?[indexPath.row]
        return cell
    }
}

extension ProfessionalExperienceViewController: UICollectionViewDelegateFlowLayout{
    
    func getHeightCell(job: Job) -> CGFloat{
        let cellWidth = self.view.frame.width * 0.95
        
        let companyHeight: CGFloat = job.companyName.height(width: cellWidth - 40, font: UIFont.boldSystemFont(ofSize: 17))
        let periodHeight: CGFloat = "De \(job.admissionDate) a \(job.termDate)".height(width: cellWidth - 40, font: UIFont.systemFont(ofSize: 15))
        let jobHeight: CGFloat = "Cargo: \(job.position)".height(width: cellWidth - 40, font: UIFont.systemFont(ofSize: 15))
        let summaryHeight: CGFloat = "Descripción: \(job.summary)".height(width: cellWidth - 40, font: UIFont.systemFont(ofSize: 15))
        
        return (167.0 + companyHeight + periodHeight + jobHeight + summaryHeight + 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var aproximatedHeight: CGFloat = 0.0
        
        if let job = jobs?[indexPath.row]{
            aproximatedHeight = getHeightCell(job: job)
        }
        
        if #available(iOS 11.0, *) {
            return CGSize(width: self.view.safeAreaLayoutGuide.layoutFrame.width * 0.95, height: aproximatedHeight)
        } else {
            // Fallback on earlier versions
            return CGSize(width: self.view.frame.width * 0.95, height: aproximatedHeight)
        }
    }
}

