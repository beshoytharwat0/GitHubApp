//
//  GFBodyLabel.swift
//  GitProject
//
//  Created by Mac on 6/24/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment : NSTextAlignment) {
           super.init(frame: .zero)
        self.textAlignment = textAlignment
        
        configure()
    }
    
    
    private func configure() {
        
        textColor = .darkGray
        // user preferredfont to make it dynamic font
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        // for make full word in same line not make half word in line and anthier half in anthier line
        lineBreakMode = .byWordWrapping
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
