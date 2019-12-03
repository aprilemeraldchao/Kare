//
//  WelcomeCell.swift
//  KarePOC
//
//  Created by Temp on 11/28/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import UIKit

class WelcomeCell:HomeCell{
    var username: String
    var profileImage: UIImage
    
    init(username: String, image: String) {
        self.username = username
        self.profileImage = UIImage(named: image) ?? UIImage(named: "defaultProfile")!
        super.init(type: "welcome")
    }
}
