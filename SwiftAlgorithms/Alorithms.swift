//  Alorithms.swift
//  SwiftAlgorithms
//
//  Created by Frederick C. Lee on 5/13/16.
//  Copyright © 2016 Amourine Technologies. All rights reserved.
// -----------------------------------------------------------------------------------------------------

import Foundation

func putZeroesToLeft(inout nums: [Int]) {
    assert(!nums.isEmpty)

    var firstAvailableSlot = (nums[0] == 0) ? 1: 0
  
    for index in firstAvailableSlot..<nums.count {
        if nums[index] == 0 {
            swap(&nums[firstAvailableSlot], &nums[index])
            firstAvailableSlot += 1
        }
        
    }
}
