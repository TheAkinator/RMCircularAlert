//
//  ViewController.swift
//  RMCircularAlert
//
//  Created by raulmo1337@gmail.com on 02/23/2018.
//  Copyright (c) 2018 raulmo1337@gmail.com. All rights reserved.
//

import UIKit
import RMCircularAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @IBAction func open(_ sender: Any) {
        CircularAlertView().presentNormalAlert(withTitle: "Fetch Error", andMessage: "Some thing went wrong while fetching data from server! Make sure that your end Point is right")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

