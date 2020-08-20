//
//  FollowerCell.swift
//  GitProject
//
//  Created by Mac on 6/25/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let identfierID = "FollowerCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel1 = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower : Follower){
        usernameLabel1.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    
    
    private func configure(){
        addSubview(usernameLabel1)
        addSubview(avatarImageView)
        
        let  padding: CGFloat = 8
    
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel1.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel1.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        
    }
}
