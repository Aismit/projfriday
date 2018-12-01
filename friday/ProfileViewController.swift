//
//  ProfileViewController.swift
//  friday
//
//  Created by Bikramjit Singh Kukreja on 11/27/18.
//  Copyright © 2018 Aismit Das. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var personalStart: UITextField!
    @IBOutlet weak var personalEnd: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        startDate = UIDatePicker()
//        startDate?.datePickerMode = .time

//        endDate = UIDatePicker()
//        endDate?.datePickerMode = .time
//
//        personalStart.inputView = startDate
//        personalEnd.inputView = endDate
//
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
