//
//  RoundableView.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/14/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 0.0{
        didSet{
            self.applyCornerRadius()
        }
    }
    @IBInspectable var shadowColor : UIColor = UIColor.clear{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    @IBInspectable var shadowOpacity : Float = 0.0{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    @IBInspectable var shadowOffset : CGSize = .zero{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    @IBInspectable var shadowRadius : CGFloat = 0.0{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    func applyCornerRadius()
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyCornerRadius()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadius()
    }
    
}
