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
    
    var viewModel: ProjectsViewModelProtocol! {
        didSet{
            self.viewModel.projectsDidChange = { [unowned self] viewModel in
                self.dismissLoadingView()
                
                DispatchQueue.main.async {
                    self.projectsCollectionView?.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        projectsCollectionView?.register(UINib(nibName: "ProjectsViewCell", bundle: nil), forCellWithReuseIdentifier: "projectCell")
    }
    
    
    @IBAction func backEvent(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension ProjectsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.projects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: indexPath) as? ProjectsViewCell else{
            return UICollectionViewCell()
        }
        
        cell.project = viewModel.projects?[indexPath.row]
        
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
        
        if let project = viewModel.projects?[indexPath.row]{
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
