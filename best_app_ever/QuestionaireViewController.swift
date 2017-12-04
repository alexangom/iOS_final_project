//
//  QuestionaireViewController.swift
//  best_app_ever
//
//  Created by Jinglin Liu on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit
let finalDataCore = DataManagment()

class QuestionaireViewController: UIViewController {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    var qNum = 0 // current question index
    var qList = [Question]()
    var finalResult = 0
    var currentSelected = 0
    var tbc: QuestionareTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishButton.isHidden = true
        qList = [Question(questionStr: "Q1: Over the past two weeks, how often have you been bothered by sadness or depressed mood?"), Question(questionStr: "Q2: Over the past two weeks, how often have you been experienced loss of enjoyment in things that were once pleasurable?"), Question(questionStr: "Q3: Over the past two weeks, how often have you been bothered by trouble falling asleep, staying asleep, or sleeping too much?"), Question(questionStr: "Q4: Over the past two weeks, how often have you been bothered by feeling tired or having little energy?"), Question(questionStr: "Q5: Over the past two weeks, how often have you been bothered by poor appetite or overeating?") , Question(questionStr: "Q6: Over the past two weeks, how often have you been bothered by feeling bad about yourself?"), Question(questionStr: "Q7: Over the past two weeks, how often have you been bothered by trouble concentrating on things, such as reading the newspaper?"), Question(questionStr: "Q8: Over the past two weeks, how often have you been bothered by moving or speaking so slowly that other people could have noticed?"), Question(questionStr: "Q9: Over the past two weeks, how often have you been bothered by throughts that you would be better off dead or of hurting yourself in some way")]
        
        navigationItem.title = "Questionnaire"
        currentQ()
        tbc?.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func currentQ(){
        if qList.count > 0 && qNum < qList.count-1 {
            qLabel.text = qList[qNum].questionStr
        }
        else if qList.count == 0 {
            let alert = UIAlertController(title: "Alert", message: "There is no question stored within the list.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }// TODO:handle if the list beyond the qNum, store and save the data
        else {
            //TODO: show Done and save the score into coredata
            let alert = UIAlertController(title: "Done", message: "Please check your result in history.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            finalDataCore.saveScore(score: finalResult)
            nextButton.isHidden = true
            finishButton.isHidden = false
            
//            //TODO: segue to history
//            let TabBarController =
//                self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
//            self.present(TabBarController, animated: true, completion: nil)
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        print("Next button in VC")
        currentSelected = myResponses.currentSelected
        print(currentSelected)
        
        finalResult += currentSelected
        print("finalResult")
        print(finalResult)
        
        //TODO: new question
        qNum += 1
        self.viewDidLoad()
        self.viewWillAppear(true)
        
        //TODO: clear the table view selection
        tbc?.viewDidLoad()
        tbc?.viewDidAppear(true)
    }
    
}
