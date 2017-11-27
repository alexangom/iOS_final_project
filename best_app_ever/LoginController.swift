//
//  LoginController.swift
//  best_app_ever
//
//  Created by Bharathiraja Nagappan on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        let userEmail = userNameTextField.text
        let userPassword = userPasswordTextField.text
        
        //validate username and password for signin
        let emailStored = UserDefaults.standard.string(forKey: "userEmail")
        let passwordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if(emailStored == userEmail){
            if(passwordStored == userPassword){
                //login successful
            
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                //dismiss login view
                self.dismiss(animated: true, completion:nil)
                
            }
        }
        
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let SignupController =
        self.storyboard?.instantiateViewController(withIdentifier: "SignupController") as! SignupController
        
        self.present(SignupController, animated: true, completion: nil)
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
