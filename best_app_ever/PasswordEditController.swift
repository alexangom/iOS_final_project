//
//  PasswordEditController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/19/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit
var dataManagment4 = DataManagment()
class PasswordEditController: UIViewController {

    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newPasswordRetype: UITextField!
    @IBOutlet weak var newUsername: UITextField!
    
    var userLoginInfo = dataManagment4.getUserCredentials()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newUsername.text = userLoginInfo["username"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updatePassword(_ sender: Any) {
        
        var userCredenetials = dataManagment4.getUserCredentials()
        let typedUserPassword = currentPassword.text
        let typedNewPassword = newPassword.text
        let typedNewPasswordRetype = newPasswordRetype.text
        let userEmail = newUsername.text
        
        
        if(userCredenetials["password"] == typedUserPassword){
            if (typedNewPassword == typedNewPasswordRetype){
                
                dataManagment4.updatetUserCredentials(username: userEmail!, password: typedNewPassword!)
                 displayMessage(userMessage: "Username/Password has been updated!")
                let ProfileController =
                    self.storyboard?.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController
            }
            else{
                displayMessage(userMessage: "Oops your password does not match.")
            }
            
            
            //dismiss login view
            self.dismiss(animated: true, completion:nil)
            
        }
        else{
            displayMessage(userMessage: "Oops your current password is wrong.")
        }
    }
    
    @IBAction func cancelUpdatePassword(_ sender: Any) {
        let ProfileController =
            self.storyboard?.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController
        self.present(ProfileController, animated: true, completion: nil)
    }
    
    //funciton to dispaly error message for user to acknowledge
    func displayMessage(userMessage:String) -> Void{
        DispatchQueue.main.async {
            let alertController = UIAlertController(title:"Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title:"OK", style: .default)
            {
                (action:UIAlertAction!)in
                //Code in this block will trigger when ok is pressed
                print("ok button pressed")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
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
