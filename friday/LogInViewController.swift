//
//  LogInViewController.swift
//  friday
//
//  Created by Aismit Das on 11/23/18.
//  Copyright © 2018 Aismit Das. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showCalendarButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showCalendar", sender: self)
    }
    
    @IBAction func makeProfileButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMakeProfile", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
