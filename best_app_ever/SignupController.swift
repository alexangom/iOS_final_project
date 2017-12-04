//
//  SignupController.swift
//  best_app_ever
//
//  Created by Bharathiraja Nagappan on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//


import UIKit



class SignupController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var sex: UIPickerView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!
    
    
    
    let userData = DataManagment()
    var savedUserSex = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sex.delegate = self
        sex.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // user sex
    let userSex = ["Male", "Female", "Other"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userSex[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userSex.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        savedUserSex = userSex[row]
           print(savedUserSex)
    }
    
 
    
    //signup button
    @IBAction func signUpButton(_ sender: Any) {
        
        //Make sure signup fields are not empty
        if (firstNameField.text?.isEmpty)! || (lastNameField.text?.isEmpty)! || (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (repeatPasswordField.text?.isEmpty)!{
            
            //Display alert message
            displayMessage(userMessage: "Oops your missing something.")
            
            return
        }
    
        //validate password in the retype password field
        if ((passwordTextField.text?.elementsEqual(repeatPasswordField.text!))! != true) {
            
            //Display alert message
            displayMessage(userMessage: "Sorry your password does not match.")
            
            return
        }
        
        
        /*
        //Creates a progess bar so that users will know that something is happening
        let myProgress = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        myProgress.center = view.center //positions it at the center of screen
        myProgress.hidesWhenStopped = true //hides progress bar when done
        
        myProgress.startAnimating() //starts the progess bar
        view.addSubview(myProgress) //adds it as part of the signup page
        */
        
        //store data locally
        
        let userName = firstNameField.text
        let userLname = lastNameField.text
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        let userBirthday = birthday.date
        let userGender = savedUserSex
        
           print(userGender)
        
        
        userData.createUserProfile(name: userName!, lastName: userLname!, gender: userGender, birthday: userBirthday , username: userEmail!, password: userPassword!)
     
    
        /* Old way of saving data into a variable
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(userLname, forKey: "userLname")
         UserDefaults.standard.set(userName, forKey: "userBirthdayM")
         UserDefaults.standard.set(userName, forKey: "userBirthdayD")
         UserDefaults.standard.set(userName, forKey: "userBirthdayY")
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        */
        
        //creates alert for user about successful signup and change view controller to login page
        let alertController = UIAlertController(title:"Alert", message: "Registration Completed. Thank You!", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title:"OK", style: .default)
        {
            (action:UIAlertAction!)in
            //Code in this block will trigger when ok is pressed
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
        //   displayMessage(userMessage: "Thank you for signing up!")
        
        
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
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    @IBAction func signup(_ sender: Any) {
        // Check user credentials with core data
        
        // Go to main app
        performSegue(withIdentifier: "GoMainSignup", sender: nil)
    }
    
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
