//
//  createEventViewController.swift
//  friday
//
//  Created by Bikramjit Singh Kukreja on 11/29/18.
//  Copyright © 2018 Aismit Das. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class createEventViewController: UIViewController {
    
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var lengthOfEvent: UITextField!
    
    
    var savedEventId : String = ""
    
//    let eventStore = EKEventStore()
//
//    if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
//    eventStore.requestAccessToEntityType(.Even, completion:
//    {granted, error in })
//
//    }
    
    private var datePicker: UIDatePicker?
    private var endPicker: UIDatePicker?
    
    @IBAction func addEvent(_ sender: Any) {
        let eventStore = EKEventStore()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH"
        var start = dateFormatter.date(from: startDate?.text ?? "01/01/2018 00")
//        var end = dateFormatter.date(from: endDate?.text ?? "01/02/2019 00")
        
        start = start?.addingTimeInterval(17.0  * 60.0 * 60.0)
        
//        var lenOfE = Int(lengthOfEvent.text ?? "1") ?? 1
        
        let end = start?.addingTimeInterval(60 * 60)
        
        createEvent(eventStore: eventStore, title: eventTitle.text ?? "NewEvent", startDate: start ?? Date(), endDate: end ?? Date().addingTimeInterval(60 * 60))
    }
    
    
    func createEvent(eventStore: EKEventStore, title: String, startDate: Date, endDate: Date) {
        
        let event = EKEvent(eventStore: eventStore)
        
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        do {
            try eventStore.save(event, span: .thisEvent)
            savedEventId = event.eventIdentifier
        } catch {
            print("Bad things happened")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(createEventViewController.dateChangedStart(datePicker:)), for: .valueChanged)
        
        startDate.inputView = datePicker
        
        endPicker = UIDatePicker()
        endPicker?.datePickerMode = .date
        endPicker?.addTarget(self, action: #selector(createEventViewController.dateChangedEnd(datePicker:)), for: .valueChanged)
        
        endDate.inputView = endPicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createEventViewController.viewTapped(gestureRecognizer:)))
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChangedStart(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        startDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func dateChangedEnd(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        endDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
