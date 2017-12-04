//
//  best_app_everTests.swift
//  best_app_everTests
//
//  Created by Alexan Gomez on 11/13/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import XCTest
@testable import best_app_ever

class best_app_everTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testActivity() {
        let nowDate = Date()
        let newActivity = Activity(fn: 7, actN: "ate cheese", emo: "😀", ts: nowDate)
        XCTAssert(newActivity.feelNum == 7, "Activity feeling number not correct")
        XCTAssert(newActivity.activityName == "ate cheese", "Activity description not correct")
        XCTAssert(newActivity.emoji == "😀", "Activity emjo not correct")
        XCTAssert(newActivity.timestamp == nowDate, "Activity date not correct")
    }
    
    // Test for data manager commented out so we do not populate core data
    /*
    func testDataManager() {
        // Test History Score
        let DataManager = DataManagment()
        DataManager.saveScore(score: 1)
        XCTAssert(DataManager.getHistoryScores().last == 1, "\(DataManager.getHistoryScores()) is not 1")
        DataManager.saveScore(score: 2)
        XCTAssert(DataManager.getHistoryScores().last == 2, "\(DataManager.getHistoryScores()) is not 2")
        
        // Test User Profile
        let bday = Date()
        DataManager.createUserProfile(name: "Tester", lastName: "Person", gender: "Test", birthday: bday, username: "test_person", password: "password123")
        
    }
    */
}
