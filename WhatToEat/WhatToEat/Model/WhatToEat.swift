//
//  WhatToEat.swift
//  WhatToEat
//
//  Created by CM on 2020/7/17.
//  Copyright © 2020 mimosa. All rights reserved.
//

import Foundation

struct WhatToEat {
    
    private(set) var lastResult: String?
    
    var foodPool: [String] = []
    
    init(pool: [String]) {
        foodPool = pool
    }
    
    mutating func getRandomResult() -> String {
        var randomResult = foodPool.randomElement()!
        if randomResult == lastResult {
            randomResult = getRandomResult()
        }
        lastResult = randomResult
        return randomResult
    }
    
    mutating func setNewPool(with newPool: [String]){
        foodPool = newPool
    }
    
}
