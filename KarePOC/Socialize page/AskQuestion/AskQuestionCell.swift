//
//  AskQuestioncell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import UIKit

class AskQuestionCell: SocializeCell{
    var profilePic: UIImage
    
    init(image:String){
        self.profilePic = UIImage(named: image) ?? UIImage(named: "defaultProfile")!

        super.init(type: "ask question")
    }
}
