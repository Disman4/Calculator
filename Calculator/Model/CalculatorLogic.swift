//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Tanaka Mawoyo on 21.11.22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol { 
            case "+/-" :
                return n * -1
            case "%" :
                return n / 100
            case "AC" :
                return 0
            case "=" :
               return performTwoNumberCalculation(n2: n)
            default :
                intermidiateCalculation = (n1: n, calcMethod: symbol)
            }
            
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermidiateCalculation?.n1, let operation = intermidiateCalculation?.calcMethod {
            
            switch operation  {
            case "+" :
                return n1 + n2
            case "-" :
                return n1 - n2
            case "×" :
                return n1 * n2
            case "÷" :
                return n1/n2
            default :
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
    
    
}
