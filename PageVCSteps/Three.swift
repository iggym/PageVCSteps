//
//  Thre.swift
//  PageVCSteps
//
//  Created by Iggy on 4/5/17.
//  Copyright © 2017 Iggy Mwangi. All rights reserved.
//

import Foundation
import UIKit

class Three: UIViewController {
    
       @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
         button.addTarget(nil, action: Selector((GotoPage.One.rawValue)), for: .touchUpInside)
    }
    
    // func getOne()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
