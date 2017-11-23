//
//  SignupController.swift
//  best_app_ever
//
//  Created by Bharathiraja Nagappan on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

class SignupController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Show navigation bar
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signup(_ sender: Any) {
        // Check user credentials with core data
        
        // Go to main app
        performSegue(withIdentifier: "GoMainSignup", sender: nil)
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