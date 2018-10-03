//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Float {
        
        let length = args.count
        
        let defalutResult: Float = 0
        
        if (length == 0) {
            print("Please enter valid arguments")
            return defalutResult
        }
        
        let operand = args[length - 1]
        switch operand {
            case "count":
                return Float(length - 1);
            case "avg":
                if (length == 1) {
                    return 0
                }
                var sum: Float = 0
                for index in 0...(length - 2) {
                    sum += Float(args[index])!
                }
                return sum/Float(length - 1)
            case "fact":
                if (length == 1) {
                    return 0
                }
                if (length == 2) {
                    var number: Float? = Float(args[0])
                    var fact: Float = 1
                    while (number! >= 1) {
                        fact = fact * number!
                        number! -= 1
                    }
                    return fact
                }
            default:
                break
            }
        
        if (length == 3) {
            let operation = args[1]
            let a:Float? = Float(args[0])
            let b:Float? = Float(args[2])
            if (a == nil || b == nil) {
                print("Please enter valid arguments")
                return defalutResult
            }
            switch operation {
                case "+":
                    return a! + b!
                case "-":
                    return a! - b!
                case "/":
                    if (b! != 0) {
                        return a! / b!
                    } else {
                        print("Error: cannot be divided by zero")
                    }
                case "%":
                    if (b! != 0) {
                        return a!.truncatingRemainder(dividingBy: b!)
                    } else {
                        print("Error: cannot be divided by zero")
                    }
                case "*":
                    return a! * b!
            default:
                break
            }
        }
    
        print("Please enter valid arguments")
        return defalutResult
    }
    
    public func calculate(_ arg: String) -> Float {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

