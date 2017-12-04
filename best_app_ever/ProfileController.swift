//
//  ProfileController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/19/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

var dataManagment2 = DataManagment()
class ProfileController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var password: UILabel!
    
    
    var userCredenetials = dataManagment2.getUserProfile()
    var userLoginInfo = dataManagment2.getUserCredentials()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName.text = userCredenetials["name"]
        lastName.text = userCredenetials["lastname"]
        birthday.text = userCredenetials["birthday"]
        gender.text = userCredenetials["gender"]
        username.text = userLoginInfo["username"]
       // password.text = userLoginInfo["password"]
        
        // Do any additional setup after loading the view.
    }

    @IBAction func userEditButton(_ sender: Any) {
        //take to user profile edit page
        let ProfileEditController =
            self.storyboard?.instantiateViewController(withIdentifier: "ProfileEditController") as! ProfileEditController
    }
    
    @IBAction func userChangePassword(_ sender: Any) {
        //take to user password change page
        let PasswordEditController =
            self.storyboard?.instantiateViewController(withIdentifier: "PasswordEditController") as! PasswordEditController
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
