//
//  GFTitleLabel.swift
//  GitProject
//
//  Created by Mac on 6/24/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame:frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment,fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        // for title shiuld be bold and i give him which size
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        
        configure()
    }
    
    
    private func configure(){
         textColor = .black
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        // if username is too much big  more than 0.9 % will add .. forexamel(beshoy...)
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}
