//
//  ArticleCell.swift
//  KarePOC
//
//  Created by temp on 12/3/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import SwiftLinkPreview
import SwiftyDrop
import UIKit

class ArticleCell: SocializeCell{
    private var result = Response()
    private let slp = SwiftLinkPreview(cache: InMemoryCache())
    
    var cellDelegate:ArticleProtocol?
    
    var image: UIImage!
    var title: String!
    var url: String
    var urlShort: String!
    
    init(url: String){
        self.url = url
        super.init(type: "article")
        setup(url)
    }
    
    func setup(_ url: String){
        if let url = self.slp.extractURL(text: url),
            let cached = self.slp.cache.slp_getCachedResponse(url: url.absoluteString) {
            self.result = cached
        }else {
            self.slp.preview(
                url,
                onSuccess: { result in
                    self.result = result
                    self.image = self.urlToImage(url: self.result.image!)
                    self.title = self.result.title!
                    self.urlShort = self.result.canonicalUrl!
                    self.cellDelegate?.updateArticle()
            },
                onError: { error in
                    print(error)
                    Drop.down(error.description, state: .error)
                    
            }
            )
        }
    }
    
    func urlToImage(url: String) -> UIImage{
        let imageUrl = URL(string: url)!
        let imageData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        return image!
    }
}

