//
//  GFRepoItemVC.swift
//  GitProject
//
//  Created by Mac on 7/1/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit


class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoTyp: .repos, withcount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoTyp: .gists, withcount: user.publicGists)
        ActionButton.set(backGroundColor: .purple, title: "GitHub Profile")
        
//      itemViewTwo.set(itemInfoTyp: .following , withcount: user.following)
//      itemViewTwo.set(itemInfoTyp: .followers, withcount: user.followers)
//
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitProfile(for: user)
    }
    
}
