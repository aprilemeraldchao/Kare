//
//  ViewController.swift
//  KarePOC
//
//  Created by Temp on 11/27/19.
//  Copyright © 2019 Temp. All rights reserved.
//

//not working, just for ref
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dummyStuff = [
        Cell(content: "one", type: "one"),
        Cell(content: "two", type: "two"),
        Cell(content: "three", type: "one"),
        Cell(content: "four", type: "two"),
        Cell(content: "five aksdhfilawebscbailweflkawbelcalwiuekbchszjbdhukijewfbrjhkjakwebd,kbszdkbawehf", type: "one"),
        Cell(content: "six", type: "two"),
        Cell(content: "seven", type: "one"),
        Cell(content: "eight", type: "two")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "cell1")
        let cellNib2 = UINib(nibName: "Home2TableViewCell", bundle: nil)
        tableView.register(cellNib2, forCellReuseIdentifier: "cell2")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        goToPage(0)
    }
    
    func goToPage(_ index: Int){
        switch index{
        case 0:
            break
        case 1:
            break
        case 2:
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
        return dummyStuff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContent = dummyStuff[indexPath.row]
        switch (cellContent.type){
        case "one":
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! HomeTableViewCell
            cell.initCell(cellContent)
            return cell
        case "two":
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! Home2TableViewCell
            cell.initCell(cellContent)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! HomeTableViewCell
            cell.initCell(cellContent)
            return cell
        }
    }
    
}

