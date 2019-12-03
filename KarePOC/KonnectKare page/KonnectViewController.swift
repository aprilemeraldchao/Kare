//
//  ViewController.swift
//  KarePOC
//
//  Created by Temp on 11/27/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class KonnectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MessagingProtocol {
        
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var konnectTableView: UITableView!
    
    override func viewDidLoad() {
        let cellNib = UINib(nibName: "DoctorTableViewCell", bundle: nil)
        konnectTableView.register(cellNib, forCellReuseIdentifier: "doctorCell")
        let cellNib2 = UINib(nibName: "MessagingTableViewCell", bundle: nil)
        konnectTableView.register(cellNib2, forCellReuseIdentifier: "messagingCell")
        
        konnectTableView.delegate = self
        konnectTableView.dataSource = self
        konnectTableView.reloadData()
        
        super.viewDidLoad()
    }
    
    func goToPage(_ index: Int){
        DummyData.curDoctor = -1
        switch index{
        case 0:
            performSegue(withIdentifier: "konnectToHome", sender: self)
            break
        case 1:
            performSegue(withIdentifier: "konnectToSocialize", sender: self)
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
        return DummyData.doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContent = DummyData.doctors[indexPath.row]
        if(indexPath.row == DummyData.curDoctor){
            let cell = konnectTableView.dequeueReusableCell(withIdentifier: "messagingCell", for: indexPath) as! MessagingTableViewCell
            cell.set(cell: cellContent)
            cell.cellDelegate = self
            return cell
        }else{
            let cell = konnectTableView.dequeueReusableCell(withIdentifier: "doctorCell", for: indexPath) as! DoctorTableViewCell
            cell.set(cell: cellContent)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DummyData.curDoctor = indexPath.row
        konnectTableView.reloadData()
    }
    
    func updateTable() {
        konnectTableView.reloadData()
    }
}

