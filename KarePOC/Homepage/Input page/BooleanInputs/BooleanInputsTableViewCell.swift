//
//  BooleanInputsTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/1/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class BooleanInputsTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var questionLabel: UILabel!
    var pickerData = ["Yes","No"]
    var cell: BooleanInputsCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Noteworthy-Light", size: 24)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        pickerLabel?.textColor = UIColor.white

        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cell.update(bool: row == 0)
    }
    
    func set(cell: BooleanInputsCell){
        self.cell = cell
        questionLabel.text = cell.prompt
        var num = 1
        if(cell.getBool()){
            num = 0
        }
        pickerView.selectRow(num, inComponent: 0, animated: false)
    }

}
