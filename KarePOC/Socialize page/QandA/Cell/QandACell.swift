//
//  QandACell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import UIKit

class QandACell: SocializeCell{
    var username: String
    var question: String
    var profilePic: UIImage
    var answers: [AnswerCell]
    
    init(username:String,question:String,image:String,answers:[AnswerCell] = [],anon:Bool){
        self.username = username
        self.profilePic = UIImage(named: image) ?? UIImage(named: "defaultProfile")!
        if anon{
            self.username = "Anonymous"
            self.profilePic = UIImage(named: "defaultProfile")!
        }
        self.question = question
        self.answers = answers
        
        super.init(type: "qandA")
    }
}
