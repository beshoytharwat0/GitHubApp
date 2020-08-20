//
//  Favorites.swift
//  GitProject
//
//  Created by Mac on 7/4/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import Foundation
class Favorites {
    var avatarImage: String?
    var usernameFav : String?



   convenience init (avatarImage: String, usernameFav: String){
    self.init()
    self.avatarImage = avatarImage
    self.usernameFav = usernameFav
    
    }
}
