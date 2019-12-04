//
//  DoctorCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import UIKit

class DoctorCell{
    var doctorName: String
    var profilePic: UIImage
    var messages: [MessageCell]
    
    init(doctorName: String, image: String, messages: [MessageCell]){
        self.doctorName = doctorName
        self.profilePic = UIImage(named: image) ?? UIImage(named: "defaultProfile")!
        self.messages = messages
    }
    
    func addMessage(_ message: MessageCell){
        messages.insert(message, at: 0)
        var resp = ""
        for (k,v) in DummyData.responses{
            if(message.content.contains(k)){
                resp = v
                break
            }
        }
        if(resp != ""){
            let response = MessageCell(type: "left", content: resp)
            messages.insert(response, at: 0)
        }
        DummyData.updateDoctor(doctorName: doctorName,messages: messages)
    }
}
