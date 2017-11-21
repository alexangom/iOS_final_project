//
//  LaunchController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/20/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {
    
    let coreData = DataManagment()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let firtTime = coreData.checkUserFirstTime()
        if (firtTime == true){
            // Core data change user variable first time to false
            coreData.userFirstTime = false
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyBoard.instantiateViewController(withIdentifier: "BarController") as! BarController
            self.navigationController?.pushViewController(homeVC, animated: true)
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
