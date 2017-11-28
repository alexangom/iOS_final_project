//
//  Monitoring.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/18/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import Foundation

class Question {
    var questionStr: String?
    var answers: [String]?
    var selectedAnswerIndex: Int?
    
    init(questionStr: String, answers: [String], selectedAnswerIndex: Int?) {
        self.questionStr = questionStr
        self.answers = answers
        self.selectedAnswerIndex = selectedAnswerIndex
    }
    
    func getquestionStr() -> String {
        return questionStr!
    }
    
    func getAnswer() -> [String] {
        return answers!
    }
    
    func getIndex() -> Int {
        return selectedAnswerIndex!
    }
}

