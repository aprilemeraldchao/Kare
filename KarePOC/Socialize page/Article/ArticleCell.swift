//
//  ArticleCell.swift
//  KarePOC
//
//  Created by temp on 12/3/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class ArticleCell: SocializeCell{
    var url:String
    
    init(url: String){
        self.url = url
        super.init(type: "article")
    }
}
