//
//  MessagingTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class MessagingTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var messagingTableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var messages: [MessageCell] = []
    var cell: DoctorCell!
    
    var cellDelegate: MessagingProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.borderColor = UIColor(named: "KareDarkPink")!.cgColor
        containerView.layer.borderWidth = 5
        containerView.layer.cornerRadius = 10
        
        headerView.layer.cornerRadius = 10
        footerView.layer.cornerRadius = 10
        
        sendButton.layer.cornerRadius = 8
        
        profilePic.layer.cornerRadius = profilePic.frame.width / 2
        profilePic.layer.borderColor = UIColor(named: "KarePink")!.cgColor
        profilePic.layer.borderWidth = 1
        
        textField.delegate = self
        
        let cellNib = UINib(nibName: "LeftMessageTableViewCell", bundle: nil)
        messagingTableView.register(cellNib, forCellReuseIdentifier: "leftMessageCell")
        let cellNib2 = UINib(nibName: "RightMessageTableViewCell", bundle: nil)
        messagingTableView.register(cellNib2, forCellReuseIdentifier: "rightMessageCell")
        messagingTableView.delegate = self
        messagingTableView.dataSource = self
        messagingTableView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
        messagingTableView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: DoctorCell){
        self.cell = cell
        doctorNameLabel.text = cell.doctorName
        profilePic.image = cell.profilePic
        messages = cell.messages
        messagingTableView.reloadData()
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        send()
    }
    
    func send(){
        let newMessage = MessageCell(type: "right", content: textField.text!)
        cell.addMessage(newMessage)
        textField.text = ""
        messagingTableView.reloadData()
        cellDelegate?.updateTable()
        textField.resignFirstResponder()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContent = messages[indexPath.row]
        switch(cellContent.type){
        case "left":
            let cell = messagingTableView.dequeueReusableCell(withIdentifier: "leftMessageCell", for: indexPath) as! LeftMessageTableViewCell
            cell.set(cell: cellContent)
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
            return cell
        case "right":
            let cell = messagingTableView.dequeueReusableCell(withIdentifier: "rightMessageCell", for: indexPath) as! RightMessageTableViewCell
            cell.set(cell: cellContent)
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
            return cell
        default:
            let cell = messagingTableView.dequeueReusableCell(withIdentifier: "rightMessageCell", for: indexPath) as! RightMessageTableViewCell
            cell.set(cell: cellContent)
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
            return cell
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        send()
        return false
    }
}
