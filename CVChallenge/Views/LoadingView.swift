//
//  LoadingView.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/10/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: UIView {

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var textAlert: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        setup()
    }
    
    private func setup() {
        let view = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?[0] as! UIView
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        loadingView.layer.cornerRadius = 10
    }
    
}
