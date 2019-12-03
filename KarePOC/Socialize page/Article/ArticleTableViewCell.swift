//
//  ArticleTableViewCell.swift
//  KarePOC
//
//  Created by temp on 12/3/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit
import SwiftyDrop
import ImageSlideshow
import SwiftLinkPreview

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var url: UILabel!
    
    private var result = Response()
    private let slp = SwiftLinkPreview(cache: InMemoryCache())
    
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
        setupArticlePreview(url: cell.url)
    }
    
    func setupArticlePreview(url: String){
        func printResult(_ result: Response) {
            print("url: ", result.url ?? "no url")
            print("finalUrl: ", result.finalUrl ?? "no finalUrl")
            print("canonicalUrl: ", result.canonicalUrl ?? "no canonicalUrl")
            print("title: ", result.title ?? "no title")
            print("images: ", result.images ?? "no images")
            print("image: ", result.image ?? "no image")
            print("video: ", result.video ?? "no video")
            print("icon: ", result.icon ?? "no icon")
            print("description: ", result.description ?? "no description")
        }
        
        func setData() {
            
//            if let value = self.result.images {
//
//                if !value.isEmpty {
//
//                    var images: [InputSource] = []
//                    for image in value {
//
//                        if let source = AlamofireSource(urlString: image) {
//
//                            images.append(source)
//
//                        }
//
//                    }
//
//                    self.setImage(images: images)
//
//                } else {
//
//                    self.setImage(image: self.result.image)
//
//                }
//
//            } else {
//
//                self.setImage(image: self.result.image)
//
//            }
//
//            if let value: String = self.result.title {
//
//                self.previewTitle?.text = value.isEmpty ? "No title" : value
//
//            } else {
//
//                self.previewTitle?.text = "No title"
//
//            }
//
//            if let value: String = self.result.canonicalUrl {
//
//                self.previewCanonicalUrl?.text = value
//
//            }
//
//            if let value: String = self.result.description {
//
//                self.previewDescription?.text = value.isEmpty ? "No description" : value
//
//            } else {
//
//                self.previewTitle?.text = "No description"
//
//            }
//
//            if let value: String = self.result.icon, let url = URL(string: value) {
//                self.favicon?.af_setImage(withURL: url)
//            }
//
//            self.showHideAll(hide: false)
//            self.endCrawling()
//
        }
        
        if let url = self.slp.extractURL(text: url),
            let cached = self.slp.cache.slp_getCachedResponse(url: url.absoluteString) {
            
            self.result = cached
            setData()
            
            printResult(result)
        }
    }
}
