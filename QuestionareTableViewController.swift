//
//  QuestionareTableViewController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//


import UIKit
var myResponses = finalAnswer()

class QuestionareTableViewController: UITableViewController {
    
    let cellId = "cellId"
    var answerList = [String]()
    var selectedIndex: Int = 0
    // var clearsSelectionOnViewWillAppear: Bool
    
    func viewWillAppear() {
        super.viewDidAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerList = ["Not at all", "Several days", "More than half of the time", "Nearly everyday"]
        self.clearsSelectionOnViewWillAppear = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = answerList.count
        
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = answerList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        
        print(selectedIndex)
        myResponses.selected(value: selectedIndex)
        
    }
    
    
}
