//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Sean Allen on 1/3/20.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername      = "This username created an invalid request. Please try again."
    case unableToComplete     = "Unable to complete your request. Please check your internet connection"
    case invalidResponse      = "Invalid response from the server. Please try again."
    case invalidData          = "The data received from the server was invalid. Please try again."
    case unableToSave         = "Unable to save the user to favorites"
    case alreadyInfFavorites  = "You have already added this user to the favorites. Probably, you are very like this one"
}
