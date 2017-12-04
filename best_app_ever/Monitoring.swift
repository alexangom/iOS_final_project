//
//  Monitoring.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/18/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import Foundation

struct finalAnswer {
    var currentSelected: Int// add value from TVC
    var response: Int// add value to VC
    
    init() {
        currentSelected = 0
        response = 0
    }
    
    mutating func selected(value:Int){
        self.currentSelected = value
    }
    
    mutating func add(value:Int) {
        self.response += value
    }
}

class Question {
    var questionStr: String?
    
    
    init(questionStr: String) {
        self.questionStr = questionStr
    }
    
    func getquestionStr() -> String {
        return questionStr!
    }
    
}
