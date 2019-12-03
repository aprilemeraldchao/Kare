//
//  AskQuestionTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit

class AskQuestionTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var anonButton: UIButton!
    
    var anon = false
    let yesAnon = "▣"
    let noAnon = "□"
    
    var cellDelegate: AskQuestionProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 5
        containerView.layer.cornerRadius = 10
                
        profilePic.layer.cornerRadius = profilePic.frame.width / 2
        profilePic.layer.borderColor = UIColor(named: "KarePink")!.cgColor
        profilePic.layer.borderWidth = 1
        
        submitButton.layer.cornerRadius = 8
        
        textView.delegate = self
        resetTextView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: AskQuestionCell){
        profilePic.image = cell.profilePic
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        let newQuestion = QandACell(username: DummyData.username, question: textView.text, image: DummyData.profilePic,anon: anon)
        self.cellDelegate?.add(question: newQuestion)
        resetTextView()
        resetAnon()
    }
    
    @IBAction func anonClicked(_ sender: Any) {
        if(anon){
            anon = false
            anonButton.setTitle(noAnon, for: .normal)
        }else{
            anon = true
            anonButton.setTitle(yesAnon, for: .normal)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.darkGray
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            resetTextView()
        }
    }
    
    func resetTextView(){
        textView.text = "Ask a question..."
        textView.textColor = UIColor.lightGray
        textView.resignFirstResponder()
    }
    
    func resetAnon(){
        anon = false
        anonButton.setTitle(noAnon, for: .normal)
    }
}
