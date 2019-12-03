//
//  QandATableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class QandATableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topContainerView.layer.borderColor = UIColor.white.cgColor
        topContainerView.layer.borderWidth = 5
        topContainerView.layer.cornerRadius = 10
        
        containerView.layer.cornerRadius = 10
        
        profilePic.layer.cornerRadius = profilePic.frame.width / 2
        profilePic.layer.borderColor = UIColor(named: "KarePink")!.cgColor
        profilePic.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: QandACell){
        usernameLabel.text = cell.username
        questionLabel.text = cell.question
        profilePic.image = cell.profilePic
    }
}
