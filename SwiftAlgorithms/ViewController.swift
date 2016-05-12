//  ViewController.swift
//  SwiftAlgorithms
//
//  Created by Frederick C. Lee on 5/11/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var resultView: UITextView!
    @IBOutlet weak var seedInput: UITextField!
    @IBOutlet weak var fiboLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var leftComputedView: UITextView!
    @IBOutlet weak var rightComputedView: UITextView!
    @IBOutlet weak var fromStorageLabel: UILabel!
    @IBOutlet weak var computedSeriesLabel: UILabel!
    
    var fibonacciMemo = [Int:Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fiboLabel.text = "Fibonacci Series: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34,..."
    }
    
    // Return the nth fibonacci number: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34,...
    func fibonacci(n:Int) -> Double {
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
        self.computedSeriesLabel.hidden = false
        self.fromStorageLabel.hidden = false
        return result
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func doFibonacci(seed:Int) {
        let msg = "Input: \(seed)\nFibonacci Result: \(fibonacci(seed))"
        self.resultView.text = msg
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let seedString = textField.text {
            if seedString.isEmpty {
                return false
            }
            // 1) Convert to array of Int, 2) Sort, 3) Make Unique via Set, 4) change to Array.
            if let seed = Int(String(seedString)) {
                doFibonacci(Int(String(seed))!)
            }
        }
        
        return true;
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func resetAction(sender: UIBarButtonItem) {
        self.seedInput.text = ""
        self.resultView.text = ""
        self.computedSeriesLabel.hidden = true
        self.fromStorageLabel.hidden = true
        self.seedInput.resignFirstResponder()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func exitAction(sender: UIBarButtonItem) {
        exit(0);
    }
    
}

