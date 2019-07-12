//
//  Extensions.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIViewController{
    public func showLoadingView(){
        self.view.endEditing(true)
        
        let loadingView = LoadingView()
        loadingView.tag = 500
        
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        loadingView.frame = CGRect.init(x: keyWindow.bounds.origin.x, y: keyWindow.bounds.origin.y, width: keyWindow.bounds.size.width, height: keyWindow.bounds.size.height)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                keyWindow.rootViewController?.view.isUserInteractionEnabled = false
                keyWindow.addSubview(loadingView)
            }
        }
    }
    
    public func dismissLoadingView(){
        DispatchQueue.main.async {
            if let viewWithTag = UIApplication.shared.keyWindow?.viewWithTag(500) {
                UIApplication.shared.keyWindow?.rootViewController?.view.isUserInteractionEnabled = true
                viewWithTag.removeFromSuperview()
            }
        }
    }
    
    public func showErrorAlert<T: UIViewController>(errorMessage: String, reference: T){
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Reintentar", style: .default, handler: { (action:UIAlertAction) -> Void in
            
            reference.showLoadingView()
            if let mainViewController = reference as? MainViewController{
                mainViewController.viewModel.getPersonalData()
            }
            else if let profExpViewController = reference as? ProfessionalExperienceViewController{
                profExpViewController.viewModel.getProfessionalExperience()
            }
            
        })
        
        alert.addAction(retryAction)
        reference.present(alert, animated: true, completion: nil)
    }
}

extension UIImageView{
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from stringURL: String) {
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: stringURL as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: stringURL){
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: stringURL as NSString)
                        self.image = image
                    }
                }
            }
        }
        else{
            self.backgroundColor = UIColor.lightGray
        }
    }
}

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
}
