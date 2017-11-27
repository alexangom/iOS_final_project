//
//  TestViewController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/23/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit
let dataManagment = DataManagment()



class TestViewController: UIViewController {
    
    var scoreData:[Int] = []
    var dateData:[Date] = []
    var profileData = [String: String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func checkHistory(_ sender: Any) {
        scoreData = dataManagment.getHistoryScores()
        dateData = dataManagment.getHistoryScoresDates()
        print(scoreData)
        print(dateData)
    }
    
    @IBAction func saveData(_ sender: Any) {
        let storeValue = 2
        dataManagment.saveScore(score: storeValue)
    }

    
    @IBAction func createUser(_ sender: Any) {
        let name = "Alexan"
        let lastName = "Gomez"
        let gender = "Male"
        let birthday = Date()
        let username = "alexangom"
        let password = "mypassword"
        
        dataManagment.createUserProfile(name: name, lastName: lastName, gender: gender, birthday: birthday, username: username, password: password)
    }
    
    
    @IBAction func getUserProfile(_ sender: Any) {
        profileData = dataManagment.getUserCredentials()
        print(profileData)
    }
    
    
    @IBAction func updateUser(_ sender: Any) {
        dataManagment.updatetUserCredentials(username: "Raja25", password: "xxxx")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
