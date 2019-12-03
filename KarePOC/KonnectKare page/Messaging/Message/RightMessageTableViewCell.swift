//
//  RightMessageTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class RightMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: MessageCell){
        contentLabel.text = cell.content
    }
}
