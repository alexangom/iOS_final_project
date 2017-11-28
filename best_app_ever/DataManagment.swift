//
//  DataManagment.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/18/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

// test brench

import Foundation
import CoreData
import UIKit

// All core data methods will be located in this model
class DataManagment {
    
    // Storing score into core data
    func saveScore(score:Int) {
        // acess to apDelegate where core data is located
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let newData = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) //Allow saving
        
        // set up context with data
        newData.setValue(score, forKey: "score")
        
        // Get time
        let time = Date()
        newData.setValue(time, forKey: "time")
        do
        {
            try context.save()
            print("Data saved")
        }
        catch
        {
            print("There is an error")//Process error
        }
    }
    
    
    // Get history scored data stored in Core Data
    func getHistoryScores() -> Array<Int>{
        var scoresData:[Int] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "History")
        request.returnsObjectsAsFaults = false
        do
        {
            let resuls = try context.fetch(request) // call the source
            if resuls.count > 0 {
                for result in resuls as! [NSManagedObject]
                {
                    if let scores = result.value(forKey: "score") as? Int
                    {
                        scoresData.append(scores)
                    }
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
        return scoresData
    }
    
    // Get history scored data dates stored in Core Data
    func getHistoryScoresDates() -> Array<Date>{
        var datesData:[Date] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "History")
        request.returnsObjectsAsFaults = false
        do
        {
            let resuls = try context.fetch(request) // call the source
            if resuls.count > 0 {
                for result in resuls as! [NSManagedObject]
                {
                    if let dates = result.value(forKey: "time") as? Date
                    {
                        datesData.append(dates)
                    }
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
        return datesData
    }
    
    //Save user profile
    func createUserProfile(name:String, lastName: String, gender:String, birthday:Date, username:String, password: String) {
        // acess to apDelegate where core data is located
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let newData = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) //Allow saving
        
        // set up context with data
        newData.setValue(name, forKey: "name")
        newData.setValue(lastName, forKey: "lastname")
        newData.setValue(gender, forKey: "gender")
        newData.setValue(birthday, forKey: "birthday")
        newData.setValue(username, forKey: "username")
        newData.setValue(password, forKey: "password")
        
        do
        {
            try context.save()
            print("Data saved")
        }
        catch
        {
            print("There is an error")//Process error
        }
    }
    
    //Get user profile data
    func getUserProfile() -> Dictionary<String, String>{
        var profileData = [String:String]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        request.returnsObjectsAsFaults = false
        do
        {
            let resuls = try context.fetch(request) // call the source
            if resuls.count > 0 {
                for result in resuls as! [NSManagedObject]
                {
                    if let name = result.value(forKey: "name") as? String
                    {
                        profileData["name"] = name
                    }
                    if let lastname = result.value(forKey: "lastname") as? String
                    {
                        profileData["lastname"] = lastname
                    }
                    if let gender = result.value(forKey: "gender") as? String
                    {
                        profileData["gender"] = gender
                    }
                    if let birthday = result.value(forKey: "birthday") as? Date
                    {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let dateString = dateFormatter.string(from:birthday as Date)
                        profileData["birthday"] = dateString
                    }
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
        return profileData
    }
    
    //Get user credentials
    func getUserCredentials() -> Dictionary<String, String>{
        var userCredentials = [String:String]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        request.returnsObjectsAsFaults = false
        do
        {
            let resuls = try context.fetch(request) // call the source
            if resuls.count > 0 {
                for result in resuls as! [NSManagedObject]
                {
                    if let username = result.value(forKey: "username") as? String
                    {
                        userCredentials["username"] = username
                    }
                    if let password = result.value(forKey: "password") as? String
                    {
                        userCredentials["password"] = password
                    }
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
        return userCredentials
    }
    
    
    //Update user profile
    func updatetUserProfile(name:String, lastname:String, birthday:Date, gender:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        request.returnsObjectsAsFaults = false
        do
        {
            let resuls = try context.fetch(request) // call the source
            if resuls.count > 0 {
                for result in resuls as! [NSManagedObject]
                {
                    result.setValue(name, forKey: "name")
                    result.setValue(lastname, forKey: "lastname")
                    result.setValue(birthday, forKey: "birthday")
                    result.setValue(gender, forKey: "gender")
                    try context.save()
                    print("prifle updated")
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
    }
    
    
    //Edit credentials
    func updatetUserCredentials(username:String, password:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        request.returnsObjectsAsFaults = false
        do
        {
            let resuls = try context.fetch(request) // call the source
            if resuls.count > 0 {
                for result in resuls as! [NSManagedObject]
                {
                    result.setValue(username, forKey: "username")
                    result.setValue(password, forKey: "password")
                    try context.save()
                    print("Credentials updated")
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
    }
    
}


