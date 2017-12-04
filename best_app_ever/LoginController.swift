//
//  LoginController.swift
//  best_app_ever
//
//  Created by Bharathiraja Nagappan on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//
import UIKit

var dataManagment1 = DataManagment()

class LoginController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // if user is loged in will skip this view and perform segue to  move to main app
      /*  if(user.userLogedIIn == true){
            performSegue(withIdentifier: "StartApp", sender: nil)
        } */
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        let typedUserEmail = userNameTextField.text
        let typedUserPassword = userPasswordTextField.text
        
        var userCredenetials = dataManagment1.getUserCredentials()
       
      
        print(typedUserEmail)
        print(typedUserPassword)
        print(userCredenetials["username"])
        print(userCredenetials["password"])
        
        if(userCredenetials["username"] == typedUserEmail){
            if(userCredenetials["password"] == typedUserPassword){
                //login successful
                print("credentials match")
                
                performSegue(withIdentifier: "navigationController", sender: self)
                
                
                /*UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                //dismiss login view
                self.dismiss(animated: true, completion:nil)*/
                
            }
        }
        
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let SignupController =
            self.storyboard?.instantiateViewController(withIdentifier: "SignupController") as! SignupController
        
        self.present(SignupController, animated: true, completion: nil)
    }
/*
    @IBAction func login(_ sender: Any) {
        // Check user credentials with core data
        
        // Go to main app
        performSegue(withIdentifier: "StartApp", sender: nil)
    }*/
}
