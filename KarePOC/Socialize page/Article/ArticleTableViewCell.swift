//
//  ArticleTableViewCell.swift
//  KarePOC
//
//  Created by temp on 12/3/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var url: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topContainerView.layer.borderColor = UIColor.white.cgColor
        topContainerView.layer.borderWidth = 5
        topContainerView.layer.cornerRadius = 10
        
        containerView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: ArticleCell){
        url.text = cell.url
    }
}
