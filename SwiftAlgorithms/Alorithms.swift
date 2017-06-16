//  Alorithms.swift
//  SwiftAlgorithms
//
//  Created by Frederick C. Lee on 5/13/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import Foundation

extension ViewController {
    // var fibonacciMemo = [Int:Double]()
    
    // Return the nth fibonacci number: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34,...
    func fibonacci(_ n:Int) -> Double {
        if let result = fibonacciMemo[n] {
            var msg = self.leftComputedView.text as String
            msg += "\(result)\n"
            self.leftComputedView.text = msg
            return result
        }
        let result = n < 2 ? Double(n):fibonacci(n-1) + fibonacci(n-2)
        var msg = self.rightComputedView.text as String
        msg += "\(result)\n"
        self.rightComputedView.text = msg
        fibonacciMemo[n] = result
        self.computedSeriesLabel.isHidden = false
        self.fromStorageLabel.isHidden = false
        return result
    }
    // -----------------------------------------------------------------------------------------------------
    
    func doFibonacci(_ seed:Int) {
        let msg = "Input: \(seed)\nFibonacci Result: \(fibonacci(seed))"
        self.resultView.text = msg
    }
    
}


