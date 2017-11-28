//
//  LaunchController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

let user = User()

class LaunchController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Check if this the firt time user uses the app
        if(user.userFirstTime == false){
            user.checkUserFirstTime()
            let loginController = self.storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
            self.navigationController?.pushViewController(loginController, animated: true)
        }
        
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
