//
//  Activity.swift
//  best_app_ever
//
//  Created by Joshua Nowak on 11/20/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import Foundation

class Activity {
    var feelNum : Int
    var activityName : String
    var emoji : String
    var timestamp : Date
    
    // Init
    init(fn : Int, actN : String, emo : String, ts : Date) {
        feelNum = fn
        activityName = actN
        emoji = emo
        timestamp = ts
    }
    
    // Return activity name
    func getActivity() -> String {
        return activityName
    }
    
    // Return activity summary
    func activitySummary() -> String {
        let sum = "Your last activity was \(activityName) on \(timestamp). It made you feel \(emoji)."
        return sum
    }
}
