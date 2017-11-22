//
//  HistoryController.swift
//  best_app_ever
//
//  Created by Alexan Gomez on 11/19/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

class HistoryController: UITableViewController {

    var activities = [Activity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadActivityLog()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "activityEntry", for: indexPath) as? activityEntry else {
            fatalError("The dequeued cell is not an instance of activityEntry.")
        }
        let activity = activities[indexPath.row]
        cell.feelingLabel.text = "You were feeling \(String(activity.feelNum)) out of 10"
        cell.activityLabel.text = "because you \(activity.activityName)"
        cell.emojiLabel?.text = activity.emoji
        
        return cell
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
    
    func loadActivityLog() {
        let activity1 = Activity(fn: 7, actN: "ate cheese", emo: "😀", ts: Date())
        let activity2 = Activity(fn: 2, actN: "failed my midterm", emo: "💩", ts: Date())
        activities += [activity1, activity2]
    }

}
