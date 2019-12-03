//
//  AnswerTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
        
        profilePic.layer.cornerRadius = profilePic.frame.width / 2
        profilePic.layer.borderColor = UIColor(named: "KarePink")!.cgColor
        profilePic.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: AnswerCell){
        usernameLabel.text = cell.username
        answerLabel.text = cell.answer
        profilePic.image = cell.profilePic
    }
}
