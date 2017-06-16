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
    
    override func viewDidLayoutSubviews() {
        self.leftComputedView.textColor = UIColor.brown
        self.rightComputedView.textColor = UIColor.brown
    }
    
      // -----------------------------------------------------------------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
    
    @IBAction func resetAction(_ sender: UIBarButtonItem) {
        self.seedInput.text = ""
        self.resultView.text = ""
        self.leftComputedView.text = ""
        self.rightComputedView.text = ""
        self.computedSeriesLabel.isHidden = true
        self.fromStorageLabel.isHidden = true
        self.seedInput.resignFirstResponder()
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    @IBAction func exitAction(_ sender: UIBarButtonItem) {
        exit(0);
    }
    
}

