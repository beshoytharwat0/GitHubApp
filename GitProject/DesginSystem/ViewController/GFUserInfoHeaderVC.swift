//
//  GFUserInfoHeaderVC.swift
//  GitProject
//
//  Created by Mac on 6/30/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    let avataImageView    = GFAvatarImageView(frame: .zero)
    let usernameLabel     = GFTitleLabel(textAlignment: .left, fontSize: 32)
    let nameLabel         = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationlabel     = GFSecondaryTitleLabel(fontSize: 15)
    let biolabel          = GFBodyLabel(textAlignment: .left)
    
    var user : User!
    
    
    init(user: User){
        super.init(nibName: nil, bundle: nil)
        self.user = user
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       addSubViews()
        layout()
        configureUIElements()
        
        
    }
    
    
    func configureUIElements(){
        avataImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text                = user.login
        nameLabel.text                    = user.name ?? ""
        locationlabel.text                = user.location ?? "No Location"
        biolabel.text                     = user.bio ?? "No bio availble"
        biolabel.numberOfLines            = 3
        
        locationImageView.image           = UIImage(named:"img_545193")
        locationImageView.tintColor       = .gray
      // "map-pin-point-11562972916azfl196qca"
    }
    

    
    func addSubViews(){
        view.addSubview(avataImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationlabel)
        view.addSubview(biolabel)

    }
    
    func layout(){
        
        let padding : CGFloat = 20
        let textImagePadding : CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avataImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avataImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avataImageView.widthAnchor.constraint(equalToConstant: 90),
            avataImageView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avataImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avataImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avataImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avataImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avataImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avataImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.heightAnchor.constraint(equalToConstant: 15),
            locationImageView.widthAnchor.constraint(equalToConstant: 15),
            
            locationlabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationlabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationlabel.heightAnchor.constraint(equalToConstant: 20),
            
            biolabel.topAnchor.constraint(equalTo: avataImageView.bottomAnchor, constant: textImagePadding),
            biolabel.leadingAnchor.constraint(equalTo: avataImageView.leadingAnchor),
            biolabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            biolabel.heightAnchor.constraint(equalToConstant: 60)
            
            ])
        
    }
   

}
