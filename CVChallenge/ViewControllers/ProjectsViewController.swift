//
//  ProjectsViewController.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/10/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var projectsCollectionView: UICollectionView?
    
    var projectsPresenter: ProjectsPresenter?
    fileprivate var projects: [Project]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectsCollectionView?.register(UINib(nibName: "ProjectsViewCell", bundle: nil), forCellWithReuseIdentifier: "projectCell")
        
        projectsPresenter?.attachView(self)
        projectsPresenter?.getProjects()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        projectsPresenter?.detachView()
    }
    
    @IBAction func backEvent(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension ProjectsViewController: ProjectsView{
    func setProjects(projects: [Project]) {
        
        self.projects = projects
        projectsCollectionView?.reloadData()
    }
}

extension ProjectsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return projects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: indexPath) as? ProjectsViewCell else{
            return UICollectionViewCell()
        }
        
        cell.project = projects?[indexPath.row]
        
        return cell
    }
}

extension ProjectsViewController: UICollectionViewDelegateFlowLayout{
    
    func getHeightCell(project: Project) -> CGFloat{
        
        let cellWidth = self.view.frame.width * 0.95
        
        let projectNameHeight: CGFloat = project.nameApp.height(width: cellWidth - 24, font: UIFont.boldSystemFont(ofSize: 17))
        let projectDescriptionHeight: CGFloat = project.descriptionApp.height(width: cellWidth - 24, font: UIFont.systemFont(ofSize: 15))
        
        return (45.0 + projectNameHeight + projectDescriptionHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var aproximatedHeight: CGFloat = 0.0
        
        if let project = projects?[indexPath.row]{
            aproximatedHeight = getHeightCell(project: project)
        }
        
        if #available(iOS 11.0, *) {
            return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width * 0.95, height: aproximatedHeight)
        } else {
            // Fallback on earlier versions
            return CGSize(width: self.view.frame.width * 0.95, height: aproximatedHeight)
        }
    }
}
