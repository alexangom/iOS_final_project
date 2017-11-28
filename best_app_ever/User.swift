//
//  User.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/18/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import Foundation

// All User profile work is performed in this model
// User check in
// User sign up
// You can use protocol or class

class User {
    var userFirstTime = true
    var userLogedIIn = false
    
    // This method changes user first time to false so launch screen is not shown anymore
    func checkUserFirstTime() {
        self.userFirstTime = false
    }
}
