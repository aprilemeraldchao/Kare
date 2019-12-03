//
//  ReminderTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 11/28/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit
import Foundation

class ReminderTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var reminderTableView: UITableView!
    @IBOutlet weak var noReminderLabel: UILabel!
    
    var reminders: [SubReminderCell] = []
    var customRemindersToShow: [CustomInputCell] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let cellNib = UINib(nibName: "SubReminderTableViewCell", bundle: nil)
        reminderTableView.register(cellNib, forCellReuseIdentifier: "SubReminderCell")
        reminderTableView.delegate = self
        reminderTableView.dataSource = self
        
        for customReminder in DummyData.customReminders{
            if customReminder.toggle{
                customRemindersToShow.append(customReminder)
            }
        }
        
        reminderTableView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count + customRemindersToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContent:SubReminderCell
        if(indexPath.row >= reminders.count){
            let newCustomReminder = CustomSubReminderCell(cell: customRemindersToShow[indexPath.row - reminders.count])
            cellContent = newCustomReminder
        }else{
            cellContent = reminders[indexPath.row]
        }
        let cell = reminderTableView.dequeueReusableCell(withIdentifier: "SubReminderCell", for: indexPath) as! SubReminderTableViewCell
        cell.set(cell: cellContent)
        return cell
    }
        
    func set(cell: ReminderCell){
        reminders = cell.remindersToShow
        if(reminders.count == 0){
            reminderTableView.isHidden = true
            noReminderLabel.isHidden = false
        }
    }
}
