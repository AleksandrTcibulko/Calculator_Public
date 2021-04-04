//
//  LogicManager.swift
//  Calculator
//
//  Created by Tsibulko on 07.09.2020.
//  Copyright © 2020 Tsibulko. All rights reserved.
//

import Foundation

class LogicManager {
    
    var calculationArray = [Double]()
    
    var lastNumber = 0.0
    var lastOperation = 0.0
    
    var currentNumber = 0.0
    
    func clear() {
        calculationArray = [Double]()
        lastNumber = 0.0
        lastOperation = 0.0
        currentNumber = 0.0
    }//end of func clear()
    
    
    func calculateAndReturn(operation: String) -> String? {
        
        if operation == "operation" {
            if calculationArray.count >= 3 {
                
                let newValue = calculate(firstNumber: calculationArray[0], secondNumber: calculationArray[2], operation: Int(calculationArray[1]))
                calculationArray.removeAll()
                calculationArray.append(newValue)
                calculationArray.append(lastOperation)
                
                return String(calculationArray[0])
            }
            
        } else if operation == "equals" {
            
            if calculationArray.count >= 1 {
                
                let newValue = calculate(firstNumber: calculationArray[0], secondNumber: lastNumber, operation: Int(lastOperation))
                calculationArray.removeAll()
                calculationArray.append(newValue)
                
                return String(calculationArray[0])
            }
        } //end of IF statement
       
        return nil
    } //end of func calculateAndReturn()
    
    
    func calculate(firstNumber: Double, secondNumber: Double, operation: Int) -> Double {
        
        var total = 0.0
        
        if let operations = Enumerations.Operations(rawValue: operation) {
            
            switch operations {
            case .add:
                total = firstNumber + secondNumber
            case .subtract:
                total = firstNumber - secondNumber
            case .multiply:
                total = firstNumber * secondNumber
            case .divide:
                total = firstNumber / secondNumber
            }//end of switch operation
            
        } //end of IF
        
        return Double(floor(1000*total)/1000)
        
    } //end of func calculate(firstNumber: Double, secondNumber: Double, operation: Int)
    
    
} //end of class LogicManager
