//
//  ViewController.swift
//  MyCalculator
//
//  Created by Allan Shivji on 2/2/19.
//  Copyright © 2019 Allan Shivji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation: String {
        case ADD = "+"
        case SUBTRACT = "-"
        case MULTIPLY = "*"
        case DIVIDE = "/"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var ans = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func numberPressed(btn: UIButton!){
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onAddPressed(_ sender: Any) {
        processOperation(op: Operation.ADD)
    }
    
    @IBAction func onSubtractPressed(_ sender: Any) {
        processOperation(op: Operation.SUBTRACT)
    }
    
    @IBAction func onMultiplyPressed(_ sender: Any) {
        processOperation(op: Operation.MULTIPLY)
    }
    
    @IBAction func onDividePressed(_ sender: Any) {
        processOperation(op: Operation.DIVIDE)
    }
    
    @IBAction func onEqualPressed(_ sender: Any) {
        processOperation(op: currentOperation)
    }
    
    @IBAction func onClearPressed(_ sender: Any) {
        leftValStr = ""
        rightValStr = ""
        runningNumber = ""
        currentOperation = Operation.Empty
        ans = ""
        outputLbl.text = "0"
    }
    
    
    func processOperation(op: Operation){
        if currentOperation != Operation.Empty {
            
            if runningNumber != ""{
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.ADD {
                    ans = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.SUBTRACT {
                    ans = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.MULTIPLY {
                    ans = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.DIVIDE {
                    ans = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                
                leftValStr = ans
                outputLbl.text = ans
            }
            
            
            currentOperation = op
            
            
        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
}

