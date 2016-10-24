//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 10/21/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var equation: UITextView!
    @IBOutlet weak var calculated: UITextView!
    var input = ""
    var num = "0"
    var rpn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearCalc(_ sender: AnyObject) {
        input = ""
        self.equation.text = input
        self.calculated.text = "0"
    }
    
    @IBAction func switchRPN(_ sender: AnyObject) {
        rpn = !rpn
    }
    
    @IBAction func equals(_ sender: AnyObject) {
        // do math????
        self.equation.text = input
        self.calculated.text = "math"
    }
    
    @IBAction func decimal(_ sender: AnyObject) {
        num = num + "."
    }
    
    @IBAction func number(_ sender: AnyObject) {
        self.calculated.text = sender.titleLabel!?.text
        print(sender.titleLabel!?.text)
    }
    
//    @IBAction func addItem(_ sender: AnyObject) {
//        self.dismiss(animated: true, completion: nil)
//        self.labelToChange.text = "Changed"
//    }
    
    
}

