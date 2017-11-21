//
//  ViewController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/13/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let coreData = DataManagment()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
<<<<<<< HEAD


    // Josh needs to prepare for segue to History from here... note
=======
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
   
>>>>>>> InfrastructureSetup
}

