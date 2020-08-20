//
//  GFButton.swift
//  GitProject
//
//  Created by Mac on 6/23/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor : UIColor,title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
   private  func configure() {
        layer.cornerRadius    = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font      = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func set (backGroundColor : UIColor, title : String){
        
        self.backgroundColor = backGroundColor
        setTitle(title, for: .normal)
    }
    
}
