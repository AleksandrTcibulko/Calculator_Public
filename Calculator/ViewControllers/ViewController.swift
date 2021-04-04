//
//  ViewController.swift
//  Calculator
//
//  Created by Tsibulko on 07.09.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var logicManager = LogicManager()
    
    var clearDisplay = false
    
    var isValidPress = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } //end of override func viewDidLoad()
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        if logicManager.calculationArray.count == 1 {
            clearClicked(sender)
        }
        
        isValidPress = true
        
        if clearDisplay == true {
            displayLabel.text! = ""
            clearDisplay = false
        }
        
        displayLabel.text! += sender.currentTitle!
        
        logicManager.currentNumber = Double(displayLabel.text!)!
        
    }//end of @IBAction func buttonClicked
    
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        
        clearDisplay = true
        
        if isValidPress == true {
            
            if logicManager.calculationArray.count == 1 {
                logicManager.calculationArray.append(Double(sender.tag))
                
            }
            else {
                logicManager.calculationArray.append(logicManager.currentNumber)
                logicManager.calculationArray.append(Double(sender.tag))
            }
            
            displayLabel.text = String(logicManager.calculationArray[0])
        }
        
        logicManager.lastOperation = Double(sender.tag)
        
        if let result = logicManager.calculateAndReturn(operation: "operation") {
            displayLabel.text = result
        }
        
        isValidPress = false
        
    } //end of @IBAction func operatorClicked
    
    
    @IBAction func equalsClicked(_ sender: Any) {
        
        isValidPress = true
        
        logicManager.lastNumber = logicManager.currentNumber
        
        if let result = logicManager.calculateAndReturn(operation: "equals") {
            displayLabel.text = result
        }
        
    } //end of @IBAction func equalsClicked
    
    
    @IBAction func clearClicked(_ sender: Any) {
        
        clearDisplay = false
        isValidPress = false
        logicManager.clear()
        displayLabel.text = ""
        
    } //end of @IBAction func clearClicked
    
    
    @IBAction func decimalClicked(_ sender: Any) {
        
        if !((displayLabel.text)?.contains("."))! {
            
            displayLabel.text! += "."
            
        } //end of IF
        
    } //end of @IBAction func decimalClicked
    
    

} //end of class ViewController: UIViewController

