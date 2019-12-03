//
//  AskFeelingTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 11/28/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class AskFeelingTableViewCell: UITableViewCell {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var feeling1Button: UIButton!
    @IBOutlet weak var feeling2Button: UIButton!
    @IBOutlet weak var feeling3Button: UIButton!
    @IBOutlet weak var feeling4Button: UIButton!
    @IBOutlet weak var feeling5Button: UIButton!
    
    var cellDelegate: AskFeelingProtocol?
    
    var curSelection = 0
    var answered = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: AskFeelingCell){
        answered = cell.answered
        continueButton.isHidden = false
        curSelection = cell.selected
        setAllHighlight()
    }
    
    func setAllHighlight(){
        feeling1Button.isHighlighted = true
        feeling2Button.isHighlighted = true
        feeling3Button.isHighlighted = true
        feeling4Button.isHighlighted = true
        feeling5Button.isHighlighted = true
        switch(curSelection){
        case 1:
            feeling1Button.isHighlighted = false
            break
        case 2:
            feeling2Button.isHighlighted = false
            break
        case 3:
            feeling3Button.isHighlighted = false
            break
        case 4:
            feeling4Button.isHighlighted = false
            break
        case 5:
            feeling5Button.isHighlighted = false
            break
        default:
            break
        }
    }
    
    func showContinue(){
        self.cellDelegate?.showContinue()
    }
    
    @IBAction func feeling1Clicked(_ sender: UIButton) {
        self.cellDelegate?.changeSelectedFeeling(selected: 1)
        curSelection = 1
        setAllHighlight()
        if(!answered){
            showContinue()
        }
    }
    
    @IBAction func feeling2Clicked(_ sender: UIButton) {
        self.cellDelegate?.changeSelectedFeeling(selected: 2)
        curSelection = 2
        setAllHighlight()
        if(!answered){
            showContinue()
        }
    }
    
    @IBAction func feeling3Clicked(_ sender: UIButton) {
        self.cellDelegate?.changeSelectedFeeling(selected: 3)
        curSelection = 3
        setAllHighlight()
        if(!answered){
            showContinue()
        }
    }
    
    @IBAction func feeling4Clicked(_ sender: UIButton) {
        self.cellDelegate?.changeSelectedFeeling(selected: 4)
        curSelection = 4
        setAllHighlight()
        if(!answered){
            showContinue()
        }
    }
    
    @IBAction func feeling5Clicked(_ sender: UIButton) {
        self.cellDelegate?.changeSelectedFeeling(selected: 5)
        curSelection = 5
        setAllHighlight()
        if(!answered){
            showContinue()
        }
    }
    
    @IBAction func continueClicked(_ sender: Any) {
        self.cellDelegate?.didTapContinue()
    }
    
}
