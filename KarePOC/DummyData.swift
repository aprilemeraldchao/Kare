//
//  HomeDummyData.swift
//  KarePOC
//
//  Created by Temp on 11/28/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class DummyData{
    
    static var tookPill = false
    static var timeForPill = "10:00 am"
    static var typeOfPill = "antibiotics"
    
    static var customRemind = "Go to yoga at 6:00 am"
    static var customToggle = true
    
    static var username = "Jane Doe"
    static var profilePic = "jane"
    
    static var selectedFeeling = 0
    static var feelings = [1,1,1,1,1,1,0]
    
    static var numCupsDrank = 0{
        didSet{
            DummyData.waterIntake[6] = DummyData.numCupsDrank
        }
    }
    static var waterIntake = [8,3,8,10,5,2,0]
    
    static var numHoursSlept = 0{
        didSet{
            DummyData.sleep[6] = DummyData.numHoursSlept
        }
    }
    static var sleep = [8,4,9,12,5,9,0]
    
    static var curDay = 3 //0 = Sunday
    
    static var reminders = [
        WaterSubReminderCell(currentWaterIntake: DummyData.numCupsDrank),
        SleepSubReminderCell(currentHoursOfSleep: DummyData.numHoursSlept),
        PrescriptionSubReminderCell(tookPill: DummyData.tookPill, time: DummyData.timeForPill, typeOfPill: DummyData.typeOfPill)
    ]
    
    static func updateReminders(){
        DummyData.reminders = [
            WaterSubReminderCell(currentWaterIntake: DummyData.numCupsDrank),
            SleepSubReminderCell(currentHoursOfSleep: DummyData.numHoursSlept),
            PrescriptionSubReminderCell(tookPill: DummyData.tookPill, time: DummyData.timeForPill, typeOfPill: DummyData.typeOfPill)
        ]
    }
    
    static var customReminders: [CustomInputCell] = [
        CustomInputCell(prompt: "Go to yoga at 9:00 am.", toggle: true)
    ]
    
    static func addCustomReminder(_ reminder: CustomInputCell){
        customReminders.append(reminder)
    }
    
    static func updateCustomReminder(_ customReminder: String, toggle: Bool){
        for reminder in DummyData.customReminders{
            if reminder.prompt == customReminder{
                reminder.toggle = toggle
                break
            }
        }
    }
    
    static var data = [
        WelcomeCell(username: DummyData.username, image: DummyData.profilePic),
        AskFeelingCell(),
        ReminderCell(reminders: DummyData.reminders),
        WeeklyAnalysisCell(feelings: DummyData.feelings),
        WaterIntakeCell(waterIntake: waterIntake),
        SleepCell(sleep: sleep)
    ]
    
    static var inputs = [
        NumberInputsCell(question: "How many cups of water did you drink today?",number:"numCupsDrank"),
        NumberInputsCell(question: "How many hours of sleep did you get last night?",number: "numHoursSlept"),
        BooleanInputsCell(question: "Did you take your \(DummyData.typeOfPill) today?",boolean:"tookPill")
    ]
    
    static func setNumberInput(_ name: String, _ num: Int){
        switch(name){
        case "numCupsDrank":
            DummyData.numCupsDrank = num
            break
        case "numHoursSlept":
            DummyData.numHoursSlept = num
            break
        default:
            break
        }
    }
    
    static func getNumberInput(_ name: String) -> Int{
        switch(name){
        case "numCupsDrank":
            return DummyData.numCupsDrank
        case "numHoursSlept":
            return DummyData.numHoursSlept
        default:
            return 0
        }
    }
    
    static func setBooleanInput(_ name: String, _ bool: Bool){
        switch(name){
        case "tookPill":
            DummyData.tookPill = bool
            break
        default:
            break
        }
    }
    
    static func getBooleanInput(_ name: String) -> Bool{
        switch(name){
        case "tookPill":
            return DummyData.tookPill
        default:
            return true
        }
    }
    
    static var curPage = 0
    
    static var socials = [
        AskQuestionCell(image: DummyData.profilePic),
        QandACell(username: DummyData.username, question: "question 1", image: DummyData.profilePic,anon:false)
    ]
    
    static func addAnswer(_ answer: AnswerCell){
        let question = DummyData.socials[curPage] as! QandACell
        question.answers.append(answer)
    }
    
    static var curDoctor = -1
    
    static var doctors = [
        DoctorCell(doctorName: "Doctor 1", image: "image", messages: []),
        DoctorCell(doctorName: "Doctor 2", image: "image", messages: [])
    ]
    
    static func updateDoctor(doctorName: String, messages: [MessageCell]){
        for doctor in doctors{
            if doctorName == doctor.doctorName{
                doctor.messages = messages
            }
        }
    }
}
