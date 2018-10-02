//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        
        let length = args.endIndex
        
        if (length == 0) {
            print("please enter valid arguments")
            return 0
        }
        
        if (length == 3) {
            let operation = args[1]
            let a:Int? = Int(args[0])
            let b:Int? = Int(args[2])
            if operation == "+" {
                return a! + b!
            } else if operation == "-" {
                return a! - b!
            } else if operation == "/" {
                if (b! != 0) {
                    return a! / b!
                } else {
                    print("cannot be divided by zero")
                }
            } else if operation == "%" {
                if (b! != 0) {
                    return a! % b!
                } else {
                    print("cannot be divided by zero")
                }
            } else if operation == "*" {
                return a! * b!
            }
        }
    
        let expression = args[length - 1]
        if expression == "count" {
            return length - 1;
        } else if expression == "avg" {
            if (length == 1) {
                return 0
            }
            var index: Int = 0
            var sum: Int = 0
            while index < length - 1 {
                let crt:Int? = Int(args[index])
                sum = sum + crt!
                index += 1
            }
            return sum/(length - 1)
        } else if expression == "fact" {
            if (length == 1) {
                return 0
            }
            var number: Int? = Int(args[0])
            var fact: Int = 1
            while (number! >= 1) {
                fact = fact * number!
                number! -= 1
            }
            return fact
        }
        print("please enter valid arguments")
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

