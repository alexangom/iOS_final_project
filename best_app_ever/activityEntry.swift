//
//  activityEntry.swift
//  best_app_ever
//
//  Created by Joshua Nowak on 11/20/17.
//  Copyright © 2017 iOS Class. All rights reserved.
//

import UIKit

class activityEntry: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
