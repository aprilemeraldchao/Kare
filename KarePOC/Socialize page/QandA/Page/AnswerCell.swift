//
//  AnswerCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import UIKit

class AnswerCell{
    var username: String
    var answer: String
    var profilePic: UIImage
    
    init(username:String, answer:String, image: String){
        self.username = username
        self.answer = answer
         self.profilePic = UIImage(named: image) ?? UIImage(named: "defaultProfile")!
    }
}
