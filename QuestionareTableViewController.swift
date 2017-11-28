//
//  QuestionareTableViewController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/21/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

class QuestionareTableViewController: UITableViewController {

    let cellId = "cellId"
    let headerId = "headerId"
    
    var questionList = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionList = [Question(questionStr: "Over the past two weeks, how often have you been bothered by sadness or depressed mood?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been experienced loss of enjoyment in things that were once pleasurable?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been bothered by trouble falling asleep, staying asleep, or sleeping too much?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been bothered by feeling tired or having little energy?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been bothered by poor appetite or overeating?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been bothered by feeling bad about yourself?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been bothered by trouble concentrating on things, such as reading the newspaper?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been bothered by moving or speaking so slowly that other people could have noticed?", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil), Question(questionStr: "Over the past two weeks, how often have you been bothered by throughts that you would be better off dead or of hurting yourself in some way", answers: ["Not at all", "Several days", "More than half of the time", "Nearly everyday"], selectedAnswerIndex: nil)]
        
        navigationItem.title = "Questionnaire"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        
        tableView.register(choiceCell.self, forCellReuseIdentifier: cellId)
        tableView.register(header.self, forHeaderFooterViewReuseIdentifier: headerId)
        
        tableView.sectionHeaderHeight = 60
        tableView.tableFooterView = UIView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //TODO: work on how to appear table view cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.questionList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! choiceCell
        
        
        if let index = navigationController?.viewControllers.index(of: self){
            let question = questionList[index]
            cell.nameLabel().text = question.answers?[indexPath.row]
        }
        
        return cell
    }
}


/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
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

//TODO: create question cell class

class choiceCell: UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func nameLabel() -> UILabel {
        let label = UILabel()
        label.text = "sample answer"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setupViews() {
        addSubview(nameLabel())
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}

class header: UITableViewHeaderFooterView{
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func nameLabel() -> UILabel {
        let label = UILabel()
        label.text = "sample question"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setupViews() {
        addSubview(nameLabel())
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}
