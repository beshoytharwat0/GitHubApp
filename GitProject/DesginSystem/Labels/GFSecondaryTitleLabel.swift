//
//  GFSecondaryTitleLabel.swift
//  GitProject
//
//  Created by Mac on 6/30/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize : CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        
        configure()
    }
    
    
    private func configure() {
        
        textColor = .black
        
       
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        // for make full word in same line not make half word in line and anthier half in anthier line
        lineBreakMode = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
