//
//  HomeDummyData.swift
//  KarePOC
//
//  Created by Temp on 11/28/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class DummyData: ArticleProtocol{
    static var quotes = ["Keep up the good work chief!","Keep your head up and your eyes open. Opportunities will come!","It's okay to be sad, just don't let that stop you from doing what you want!","You got this, period.","Tomorrow's a new day. It'll be okay!"]
    static var emojis = ["🙂","😐","☹️","😖","😭"]
    
    static var tookPill = false
    static var timeForPill = "10:00 am"
    static var typeOfPill = "antibiotics"
    
    static var customRemind = "Go to yoga at 6:00 am"
    static var customToggle = true
    
    static var username = "Emily Kim"
    static var profilePic = "Emily Kim"
    
    static var selectedFeeling = 0
    static var feelings = DummyData.genRandomData(from: 1, to: 5)
    
    static var numCupsDrank = 0{
        didSet{
            DummyData.waterIntake[6] = DummyData.numCupsDrank
        }
    }
    static var waterIntake = DummyData.genRandomData(from: 5, to: 16)
    
    static var numHoursSlept = 0{
        didSet{
            DummyData.sleep[6] = DummyData.numHoursSlept
        }
    }
    static var sleep = DummyData.genRandomData(from: 0, to: 24)
    
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
        QandACell(username: "Andrew Frank", question: "Is milk tea bad for you?", image: "Andrew Frank", answers: [AnswerCell(username: "Karen Hesley", answer: "Too much of anything can be bad for you.", image: "Karen Hesley"), AnswerCell(username: "Deric Lei", answer: "Depends...are you lactose intolerant?", image: "Deric Lei")], anon: false),
        ArticleCell(url: "https://www.psychologytoday.com/us/blog/click-here-happiness/201812/self-care-12-ways-take-better-care-yourself"),
        QandACell(username: "Anonymous", question: "Should pee be yellow or clear?", image: "anon", anon:true),
        ArticleCell(url: "https://www.medicalnewstoday.com/articles/amp/327208"),
        ArticleCell(url: "https://www.webmd.com/mental-health/addiction/news/20191115/are-vaping-bans-the-way-to-go")
    ]
    
    static func addAnswer(_ answer: AnswerCell){
        let question = DummyData.socials[curPage] as! QandACell
        question.answers.append(answer)
    }
    
    static var curDoctor = -1
    
    static var doctors = [
        DoctorCell(doctorName: "Dr. Mills", image: "Mills", messages: [
            MessageCell(type: "right", content: "Ok, thank you!"),
            MessageCell(type: "left", content: "Try a heat pack first. But, if the pain continues to worsen, take one dosage every 6 hours as needed. Let me know if the pain continues after a week."),
            MessageCell(type: "right", content: "My back pain started up again...should I take pain killers?"),
            MessageCell(type: "left", content: "Hello Emily!"),
            MessageCell(type: "right", content: "Hi Dr. Mills")
        ]),
        DoctorCell(doctorName: "Dr. Johnson", image: "Johnson", messages: [])
    ]
    
    static var responses = [
        "hey": "Hi Emily!",
        "brand": "I like to recommend Listerine (alchohol-free).",
        "thank": "No problem! Also, remember you have an appointment for a filling next Tuesday."
    ]
    
    static func updateDoctor(doctorName: String, messages: [MessageCell]){
        for doctor in doctors{
            if doctorName == doctor.doctorName{
                doctor.messages = messages
            }
        }
    }
    
    static func genRandomData(from: Int, to: Int) -> [Int]{
        var arr:[Int] = []
        for _ in 1...6{
            arr.append(Int.random(in: from...to))
        }
        arr.append(0)
        return arr
    }
    
    func updateArticle() {
    }
}
