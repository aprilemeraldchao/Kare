
//
//  CustomInputTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class CustomInputTableViewCell: UITableViewCell {

    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
            
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: CustomInputCell){
        promptLabel.text = cell.prompt
        toggleSwitch.isOn = cell.toggle
    }
    
    @IBAction func toggle(_ sender: Any) {
        DummyData.updateCustomReminder(promptLabel.text!, toggle: toggleSwitch.isOn)
    }
}
