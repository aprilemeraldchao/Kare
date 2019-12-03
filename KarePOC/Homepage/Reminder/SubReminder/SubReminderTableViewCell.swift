//
//  SubReminderTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class SubReminderTableViewCell: UITableViewCell {

    @IBOutlet weak var reminderText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: SubReminderCell){
        reminderText.sizeThatFits(CGSize(width: reminderText.frame.size.width, height: reminderText.frame.size.height))
        reminderText.text = cell.reminder
    }
}
