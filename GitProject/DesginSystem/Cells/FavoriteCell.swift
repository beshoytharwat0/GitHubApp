//
//  FavoriteCell.swift
//  GitProject
//
//  Created by Mac on 7/3/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {

    static let identfierID = "FavoriteCell"
    let cellView = UIView()
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel1 = GFTitleLabel(textAlignment: .left, fontSize: 26)
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower){
        usernameLabel1.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
        
    }
    
    
    private func configure(){
        addSubview(cellView)

        cellView.addSubview(avatarImageView)
        cellView.addSubview(usernameLabel1)
        cellView.layer.cornerRadius = 12
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        cellView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)

       accessoryType       = .disclosureIndicator
       let  padding: CGFloat    = 12
        
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel1.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel1.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel1.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        
        
    }
    
}
