//
//  ProfileEditController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/19/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

var dataManagment3 = DataManagment()
class ProfileEditController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var editFirstName: UITextField!
    @IBOutlet weak var editLastName: UITextField!
    @IBOutlet weak var editBirthday: UIDatePicker!
    @IBOutlet weak var editSex: UIPickerView!
    
    
    var userCredenetials = dataManagment3.getUserProfile()
    var userLoginInfo = dataManagment3.getUserCredentials()
    
    var newUserSex = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editSex.delegate = self
        editSex.dataSource = self
        editFirstName.text = userCredenetials["name"]
        editLastName.text = userCredenetials["lastname"]
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
        newUserSex = userSex[row]
        print(newUserSex)
    }
    
    
    
    @IBAction func updateUserInfo(_ sender: Any) {
        //Make sure edit fields are not empty
        if (editFirstName.text?.isEmpty)! || (editLastName.text?.isEmpty)!  {
            
            //Display alert message
            displayMessage(userMessage: "Oops your missing something.")
            
            return
        }
   
        let userName = editFirstName.text
        let userLname = editLastName.text
        let userBirthday = editBirthday.date
        let userGender = newUserSex
        
         dataManagment3.updatetUserProfile(name: userName! , lastname: userLname!, birthday: userBirthday, gender: userGender)
        
        let TabBarController =
            self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        self.present(TabBarController, animated: true, completion: nil)
       
    }
    
    @IBAction func cancelUserInfoUpdate(_ sender: Any) {
        let TabBarController =
            self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        self.present(TabBarController, animated: true, completion: nil)
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
