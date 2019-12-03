//
//  QandAViewController.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class QandAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate{
    
    @IBOutlet weak var questionContainerView: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var commentContainerView: UIView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentTextField: UITextView!
    
    @IBOutlet weak var answersTableView: UITableView!
    
    override func viewDidLoad() {
        questionContainerView.layer.cornerRadius = 10
        commentContainerView.layer.cornerRadius = 10
        
        profilePic.layer.cornerRadius = profilePic.frame.width / 2
        profilePic.layer.borderColor = UIColor(named: "KarePink")!.cgColor
        profilePic.layer.borderWidth = 1
        
        commentTextField.layer.borderColor = UIColor.darkGray.cgColor
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.cornerRadius = 5
        commentTextField.delegate = self
        commentTextField.text = ""
        
        let cellNib = UINib(nibName: "AnswerTableViewCell", bundle: nil)
        answersTableView.register(cellNib, forCellReuseIdentifier: "answerCell")
        answersTableView.delegate = self
        answersTableView.dataSource = self
        answersTableView.reloadData()
        
        set(cell: DummyData.socials[DummyData.curPage] as! QandACell)
        
        super.viewDidLoad()
    }
    
    func set(cell: QandACell){
        usernameLabel.text = cell.username
        questionLabel.text = cell.question
        profilePic.image = cell.profilePic
    }
    
    func goToPage(_ index: Int){
        switch index{
        case 0:
            performSegue(withIdentifier: "qandAToHome", sender: self)
            break
        case 1:
            performSegue(withIdentifier: "qandAToSocialize", sender: self)
            break
        case 2:
            performSegue(withIdentifier: "qandAToKonnect", sender: self)
            break
        default:
            break
        }
    }
    
    @IBAction func pageChanged(_ sender: UISegmentedControl) {
        goToPage(sender.selectedSegmentIndex)
    }
    
    @IBAction func commentClicked(_ sender: Any) {
        comment()
    }
    
    func comment(){
        let newAnswer = AnswerCell(username: DummyData.username, answer: commentTextField.text!, image: DummyData.profilePic)
        DummyData.addAnswer(newAnswer)
        commentTextField.text = ""
        answersTableView.reloadData()
        commentTextField.resignFirstResponder()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let question = DummyData.socials[DummyData.curPage] as! QandACell
        return question.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let question = DummyData.socials[DummyData.curPage] as! QandACell
        let cellContent = question.answers[indexPath.row]
        let cell = answersTableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! AnswerTableViewCell
        cell.set(cell: cellContent)
        return cell
    }
}
