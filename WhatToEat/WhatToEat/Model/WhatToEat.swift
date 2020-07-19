//
//  WhatToEat.swift
//  WhatToEat
//
//  Created by CM on 2020/7/17.
//  Copyright © 2020 mimosa. All rights reserved.
//

import Foundation

struct WhatToEat {
    
    private(set) var lastResult: Food?
    
    var foodPool: [Food] = []
    
    init(pool: [Food] = []) {
        if pool.isEmpty {
            for str in WhatToEat.StrPool {
                foodPool.append(Food(name: str))
            }
        }
    }
    
    mutating func getRandomResult() -> Food {
        var randomResult = foodPool.randomElement()!
        if randomResult == lastResult {
            randomResult = getRandomResult()
        }
        lastResult = randomResult
        return randomResult
    }
    
    mutating func setNewPool(with newPool: [Food]){
        foodPool = newPool
    }
    
}

// MARk: - Static Model
extension WhatToEat {
    static let StrPool: [String] =
        [" 麻辣香锅🥘"," 麻辣烫🌶"," 肉蟹煲🦀"," 面条🍝"," 汉堡🍔",
         " 炸鸡🍗"," 馄饨饺子🥟"," 咖喱饭🍛"," 寿司🍣"," 简餐🍱",
         " 火锅🍲"," 便利店🏪"," 蛋糕🍰"," 海鲜🦞"," 披萨🍕",
         " 牛排🥩"," 沙拉🥗"," 三明治🥪"," 烧烤🍺"," 烤肉🍖",
         " 黄焖鸡米饭🍚"," 沙县小吃🥧"," 兰州拉面🍜"," 西餐🍽"," 面包🥐"]
}
