//
//  ViewController.swift
//  KarePOC
//
//  Created by Temp on 11/27/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AskFeelingProtocol {
        
    @IBOutlet weak var homeTableView: UITableView!
    var data = DummyData.data
    var customInputsToShow: [CustomInputCell] = []
    
    override func viewDidLoad() {
        
        let cellNib = UINib(nibName: "WelcomeTableViewCell", bundle: nil)
        homeTableView.register(cellNib, forCellReuseIdentifier: "welcomeCell")
        let cellNib2 = UINib(nibName: "AskFeelingTableViewCell", bundle: nil)
        homeTableView.register(cellNib2, forCellReuseIdentifier: "askFeelingCell")
        let cellNib3 = UINib(nibName: "ReminderTableViewCell", bundle: nil)
        homeTableView.register(cellNib3, forCellReuseIdentifier: "reminderCell")
        let cellNib4 = UINib(nibName: "WeeklyAnalysisTableViewCell", bundle: nil)
        homeTableView.register(cellNib4, forCellReuseIdentifier: "weeklyAnalysisCell")
        let cellNib5 = UINib(nibName: "WaterIntakeTableViewCell", bundle: nil)
        homeTableView.register(cellNib5, forCellReuseIdentifier: "waterIntakeCell")
        let cellNib6 = UINib(nibName: "SleepTableViewCell", bundle: nil)
        homeTableView.register(cellNib6, forCellReuseIdentifier: "sleepCell")
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.reloadData()
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeTableView.reloadData()
    }
    
    func goToPage(_ index: Int){
        switch index{
        case 1:
            performSegue(withIdentifier: "homeToSocialize", sender: self)
            break
        case 2:
            performSegue(withIdentifier: "homeToKonnect", sender: self)
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContent = data[indexPath.row]
        switch(cellContent.type){
        case "welcome":
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "welcomeCell", for: indexPath) as! WelcomeTableViewCell
            cell.set(cell: cellContent as! WelcomeCell)
            return cell
        case "ask feeling":
            if(DummyData.selectedFeeling == 0){
                let cell = homeTableView.dequeueReusableCell(withIdentifier: "askFeelingCell", for: indexPath) as! AskFeelingTableViewCell
                cell.cellDelegate = self
                return cell
            }else{
                let cell = homeTableView.dequeueReusableCell(withIdentifier: "askFeelingCell", for: indexPath) as! AskFeelingTableViewCell
                let content = cellContent as! AskFeelingCell
                content.set(selected: DummyData.selectedFeeling)
                cell.set(cell: content)
                cell.cellDelegate = self
                return cell
            }
        case "reminder":
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath) as! ReminderTableViewCell
            let content = cellContent as! ReminderCell
            content.update()
            cell.set(cell: content)
            return cell
        case "weekly analysis":
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "weeklyAnalysisCell", for: indexPath) as! WeeklyAnalysisTableViewCell
            cell.set(cell: cellContent as! WeeklyAnalysisCell)
            return cell
        case "water intake":
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "waterIntakeCell", for: indexPath) as! WaterIntakeTableViewCell
            let content = cellContent as! WaterIntakeCell
            content.setAmount(DummyData.numCupsDrank)
            cell.set(cell: content)
            return cell
        case "sleep":
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "sleepCell", for: indexPath) as! SleepTableViewCell
            let content = cellContent as! SleepCell
            content.setAmount(DummyData.numHoursSlept)
            cell.set(cell: content)
            return cell
        default:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "subReminderCell", for: indexPath) as! SubReminderTableViewCell
            cell.set(cell: cellContent as! SubReminderCell)
            return cell
        }
    }
    
    func didTapContinue() {
        performSegue(withIdentifier: "homeToInput", sender: self)
    }
    
    func showContinue(){
        let selectedIndexPath = IndexPath(item:1 , section: 0)
        self.homeTableView.reloadRows(at: [selectedIndexPath], with: .none)
    }
    
    func changeSelectedFeeling(selected: Int) {
        DummyData.selectedFeeling = selected
        let cellContent = DummyData.data[3] as! WeeklyAnalysisCell
        cellContent.feelings[6] = selected
        let selectedIndexPath = IndexPath(item:3 , section: 0)
        self.homeTableView.reloadRows(at: [selectedIndexPath], with: .none)
    }
}

