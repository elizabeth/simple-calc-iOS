//
//  ViewController.swift
//  simple-calc
//
//  Created by Elizabeth on 10/21/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var equation: UITextView!
    @IBOutlet weak var calculated: UITextView!
    @IBOutlet weak var rpnButton: UIButton!
    var num = ""
    var calculatedNum = 0.0
    var mathOp = ""
    var rpn = false
    var rpnNum = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayResult() {
        num = ""
        self.calculated.text = String(calculatedNum)
    }
    
    @IBAction func clearCalc(_ sender: AnyObject) {
        num = ""
        mathOp = ""
        calculatedNum = 0.0
        self.calculated.text = "0"
    }
    
    @IBAction func switchRPN(_ sender: AnyObject) {
        rpn = !rpn
        if (rpn) {
            rpnButton.backgroundColor = UIColor(red: (236/255.0), green: (126/255.0), blue: (189/255.0), alpha: 1.0)
            rpnButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            rpnButton.backgroundColor = UIColor(red: (190/255.0), green: (191/255.0), blue: (193/255.0), alpha: 1.0)
            rpnButton.setTitleColor(self.view.tintColor, for: .normal)
        }
    }
    
    
    @IBAction func operation(_ sender: AnyObject) {
    
        let op = (sender.titleLabel!?.text)!
        
        if (rpn) {
        
        } else {
            if (mathOp == "" && num != "") {
                calculatedNum = Double(num)!
            }
            
            if (mathOp != "") {
                calculate()
            }
            
            mathOp = op
            num = ""
        }
    }
    
    @IBAction func multiOperation(_ sender: AnyObject) {
        let op = sender.titleLabel!?.text
        
        if (rpn) {
            
        } else {
            switch op! {
            case "count":
                num = ""
            case "avg":
                num = ""
            case "fact":
                let factNum: Int? = Int(num)
                if factNum == nil{
                    print("Factorial number must be an integer")
                    calculatedNum = 0
                } else if factNum == 0 {
                    calculatedNum = 1
                } else {
                    var result = factNum!
                    var temp = factNum! - 1
                    while temp > 0 {
                        result = result * temp
                        temp = temp - 1
                    }
                    
                    calculatedNum = Double(result)
                }
            default:
                print("Error")
                break
            }
            displayResult()
        }
    }
    
    func calculate() {
        switch mathOp {
        case "+":
            calculatedNum += Double(num)!
        case "-":
            calculatedNum -= Double(num)!
        case "×":
            calculatedNum = calculatedNum * Double(num)!
        case "÷":
            calculatedNum = calculatedNum / Double(num)!
        case "%":
            calculatedNum = calculatedNum.truncatingRemainder(dividingBy: Double(num)!)
        default:
            print("Error. Please try again")
        }
        
        mathOp = ""
        displayResult()
    }
    
    @IBAction func equals(_ sender: AnyObject) {
        
        if (rpn) {
            
        } else {
            calculate()
        }

    }
    
    @IBAction func decimal(_ sender: AnyObject) {
        num = num + "."
        self.calculated.text = num
    }
    
    @IBAction func number(_ sender: AnyObject) {
        let pressed = (sender.titleLabel!?.text)!
        num = num + pressed
        self.calculated.text = num
    }
    
}

