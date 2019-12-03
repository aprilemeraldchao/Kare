//
//  ViewController.swift
//  KarePOC
//
//  Created by Temp on 11/27/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class SocializeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AskQuestionProtocol {
    
    @IBOutlet weak var socializeTableView: UITableView!
    private var result = Response()
    private let slp = SwiftLinkPreview(cache: InMemoryCache())
    
    override func viewDidLoad() {
        let cellNib = UINib(nibName: "QandATableViewCell", bundle: nil)
        socializeTableView.register(cellNib, forCellReuseIdentifier: "qandACell")
        let cellNib2 = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        socializeTableView.register(cellNib2, forCellReuseIdentifier: "articleCell")
        let cellNib3 = UINib(nibName: "AskQuestionTableViewCell", bundle: nil)
        socializeTableView.register(cellNib3, forCellReuseIdentifier: "askQuestionCell")
        
        socializeTableView.delegate = self
        socializeTableView.dataSource = self
        socializeTableView.reloadData()
        
        super.viewDidLoad()
    }
    
    func goToPage(_ index: Int){
        switch index{
        case 0:
            performSegue(withIdentifier: "socializeToHome", sender: self)
            break
        case 2:
            performSegue(withIdentifier: "socializeToKonnect", sender: self)
            break
        default:
            break
        }
    }
    
    @IBAction func pageChanged(_ sender: UISegmentedControl) {
        goToPage(sender.selectedSegmentIndex)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.socials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContent = DummyData.socials[indexPath.row]
        switch(cellContent.type){
        case "qandA":
            let cell = socializeTableView.dequeueReusableCell(withIdentifier: "qandACell", for: indexPath) as! QandATableViewCell
            cell.set(cell: cellContent as! QandACell)
            return cell
        case "ask question":
            let cell = socializeTableView.dequeueReusableCell(withIdentifier: "askQuestionCell", for: indexPath) as! AskQuestionTableViewCell
            cell.set(cell: cellContent as! AskQuestionCell)
            cell.cellDelegate = self
            return cell
        default:
            let cell = socializeTableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleTableViewCell
            cell.set(cell: cellContent as! ArticleCell)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellContent = DummyData.socials[indexPath.row]
        switch(cellContent.type){
        case "qandA":
            DummyData.curPage = indexPath.row
            performSegue(withIdentifier: "socializeToQandA", sender: self)
            break
        case "article":
            UIApplication.shared.open(URL(string: (cellContent as! ArticleCell).url)!, options: [:], completionHandler: nil)
            break
        default:
            break
        }
    }
    
    func add(question: QandACell) {
        DummyData.socials.append(question)
        socializeTableView.reloadData()
    }
}

