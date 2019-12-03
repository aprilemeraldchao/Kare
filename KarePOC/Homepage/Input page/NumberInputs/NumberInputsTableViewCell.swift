//
//  NumberInputsTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/1/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class NumberInputsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    var cell: NumberInputsCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    stepper.setDecrementImage(stepper.decrementImage(for: .normal), for: .normal)
    stepper.setIncrementImage(stepper.incrementImage(for: .normal), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func set(cell: NumberInputsCell){
        self.cell = cell
        questionLabel.text = cell.prompt
        numLabel.text = "\(cell.getAmount())"
        stepper.value = Double(cell.getAmount())
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        numLabel.text = "\(Int(sender.value))"
        cell.update(num: Int(sender.value))
    }
}
