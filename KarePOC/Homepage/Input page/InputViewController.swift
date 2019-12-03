//
//  InputViewController.swift
//  KarePOC
//
//  Created by Temp on 11/28/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddCustomInputProtocol {
    
    @IBOutlet weak var inputsTableView: UITableView!
    
    override func viewDidLoad() {
        let cellNib = UINib(nibName: "NumberInputsTableViewCell", bundle: nil)
        inputsTableView.register(cellNib, forCellReuseIdentifier: "numberInputsCell")
        let cellNib2 = UINib(nibName: "BooleanInputsTableViewCell", bundle: nil)
        inputsTableView.register(cellNib2, forCellReuseIdentifier: "booleanInputsCell")
        let cellNib3 = UINib(nibName: "CustomInputTableViewCell", bundle: nil)
        inputsTableView.register(cellNib3, forCellReuseIdentifier: "customInputsCell")
        let cellNib4 = UINib(nibName: "AddCustomInputTableViewCell", bundle: nil)
        inputsTableView.register(cellNib4, forCellReuseIdentifier: "addCustomInputCell")
        
        inputsTableView.delegate = self
        inputsTableView.dataSource = self
        inputsTableView.reloadData()
        
        super.viewDidLoad()
    }
    
    func goToPage(_ index: Int){
        switch index{
        case 0:
            performSegue(withIdentifier: "inputToHome", sender: self)
            break
        case 1:
            performSegue(withIdentifier: "inputToSocialize", sender: self)
            break
        case 2:
            performSegue(withIdentifier: "inputToKonnect", sender: self)
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
        return DummyData.inputs.count + DummyData.customReminders.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContent: InputCell
        if(indexPath.row == DummyData.inputs.count + DummyData.customReminders.count){
            cellContent = AddCustomInputCell()
        }
        else if(indexPath.row >= DummyData.inputs.count){
            cellContent =  DummyData.customReminders[indexPath.row - DummyData.inputs.count]
        }else{
            cellContent = DummyData.inputs[indexPath.row]
        }
        switch(cellContent.type){
        case "number":
            let cell = inputsTableView.dequeueReusableCell(withIdentifier: "numberInputsCell", for: indexPath) as! NumberInputsTableViewCell
            cell.set(cell: cellContent as! NumberInputsCell)
            return cell
        case "boolean":
            let cell = inputsTableView.dequeueReusableCell(withIdentifier: "booleanInputsCell", for: indexPath) as! BooleanInputsTableViewCell
            cell.set(cell: cellContent as! BooleanInputsCell)
            return cell
        case "custom input":
            let cell = inputsTableView.dequeueReusableCell(withIdentifier: "customInputsCell", for: indexPath) as! CustomInputTableViewCell
            cell.set(cell: cellContent as! CustomInputCell)
            return cell
        default:
            let cell = inputsTableView.dequeueReusableCell(withIdentifier: "addCustomInputCell", for: indexPath) as! AddCustomInputTableViewCell
            cell.cellDelegate = self
            return cell
        }
    }
    
    func updateInputs() {
        inputsTableView.reloadData()
    }
    
    func goHome(){
        performSegue(withIdentifier: "inputToHome", sender: self)
    }
}
