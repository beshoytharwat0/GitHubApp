//
//  GFFollowerVC.swift
//  GitProject
//
//  Created by Mac on 7/1/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit


class GFFollowerVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoTyp: .followers , withcount: user.followers)
        itemInfoViewTwo.set(itemInfoTyp: .following, withcount: user.following)
        ActionButton.set(backGroundColor:#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapFollowers(for: user)
    }
    
}
