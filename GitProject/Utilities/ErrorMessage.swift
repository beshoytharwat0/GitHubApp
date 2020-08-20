//
//  ErrorMessage.swift
//  GitProject
//
//  Created by Mac on 6/25/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import Foundation

enum ErrorMassage : String, Error {
    case invalidUsername   = "this username created an invalid request.please try again."
    case unableToComplete  = "Unable to complete your request, Please check your internet connect."
    case invalidResponse   = "Invalid response from the server, Please try agian."
    case invalidData       = " the data received the server was invalid, Please try again."
    case unabelFavorite    = " There was an error favoriting this user, plaese try again."
    case alreadyInFavorirtes = "you've already favorited this user. you must Really like them!."
}
