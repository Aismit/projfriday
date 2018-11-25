//
//  ViewController.swift
//  friday
//
//  Created by Aismit Das on 11/23/18.
//  Copyright © 2018 Aismit Das. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func letsGoButoon(_ sender: UIButton) {
        performSegue(withIdentifier: "startPath", sender: self)
    }
    
}

