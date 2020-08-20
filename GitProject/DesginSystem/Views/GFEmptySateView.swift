//
//  GFEmptySateView.swift
//  GitProject
//
//  Created by Mac on 6/28/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFEmptySateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(message : String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    private func configure(){
         addSubview(messageLabel)
         addSubview(logoImage)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .darkGray
        
        logoImage.image = UIImage(named: "empty-state-logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -120),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
            
            ])
        
    }
}
