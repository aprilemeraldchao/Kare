//
//  AddCustomInputTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class AddCustomInputTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var addReminderButton: UIButton!
    var cellDelegate: AddCustomInputProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.delegate = self
        textView.text = ""
        
        doneButton.layer.cornerRadius = 8
        
        addReminderButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addReminderClicked(_ sender: Any) {
        if(textView.text != ""){
            addReminder()
            cellDelegate?.updateInputs()
        }
    }
    
    func addReminder(){
        let newCustomInput = CustomInputCell(prompt: textView.text, toggle: true)
        DummyData.addCustomReminder(newCustomInput)
        textView.text = ""
        textView.resignFirstResponder()
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        cellDelegate?.goHome()
    }
}
