//
//  DataManagment.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/18/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import Foundation

// All core data methods will be located in this model

class DataManagment {
    var userFirstTime = true
    
    // Method to check if user is launching app for firt time
    // Return true if this is the case return false if opposite
    // Access to core data and check if is the first time the app is opened
    func checkUserFirstTime() -> Bool {
        if(userFirstTime==true){
            return true
        }else{
            return false
        }
    }
}
