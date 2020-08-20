//
//  GFItemFoView.swift
//  GitProject
//
//  Created by Mac on 7/1/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit


enum  ItemInfotype {
    case repos
    case gists
    case followers
    case following
}

class GFItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
      addSubview(symbolImageView)
      addSubview(titleLabel)
       addSubview(countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor   = .black
        let padding : CGFloat = 20
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: padding),
            symbolImageView.heightAnchor.constraint(equalToConstant: padding),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
            
            ])
        
    
    }
    
    
    func set (itemInfoTyp : ItemInfotype, withcount count: Int) {
        
        switch itemInfoTyp {
        case .repos:
            symbolImageView.image  = UIImage(named: "iconfinder_free-11_463001")
            titleLabel.text        = "Public Repos"
            
        case . gists:
            symbolImageView.image  = UIImage(named: "text_align_left-512")
            titleLabel.text        = "Public Gists"
            
        case . followers:
            symbolImageView.image  = UIImage(named: "Heart_C-512")
            titleLabel.text        = "Followers"
            
        case .following:
            symbolImageView.image  = UIImage(named: "Follower-Following-512 (1)")
            titleLabel.text        = "Following"
       }
        
            countLabel.text        = String(count)
    }
    
    
}
