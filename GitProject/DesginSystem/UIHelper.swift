//
//  UIHelper.swift
//  GitProject
//
//  Created by Mac on 6/27/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit


struct UIHelper {
    
    // func to make 3 colums desgin for the collectionview
    
    static func creatThreeColumFlowLayout(in view: UIView) -> UICollectionViewFlowLayout{
        let width                        = view.bounds.width
        let padding : CGFloat            = 12
        let minimumItemSpacting: CGFloat = 10
        let availableWidth               = width - (padding * 2) - (minimumItemSpacting * 2)
        let itemWidth                    = availableWidth / 3
        
        let flowLayout                   = UICollectionViewFlowLayout()
        flowLayout.sectionInset          = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize              = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
