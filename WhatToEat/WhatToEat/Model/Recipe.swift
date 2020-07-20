//
//  Recipe.swift
//  WhatToEat
//
//  Created by CM on 2020/7/20.
//  Copyright © 2020 mimosa. All rights reserved.
//

import Foundation

class Recipe: NSObject, NSCoding {

    var title: String
    var contents: [String]
    
    var isCurrent: Bool
    
    init(title: String, contents: [String], isCurrent: Bool) {
        self.title = title
        self.contents = contents
        
        self.isCurrent = isCurrent
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "title")
        coder.encode(contents, forKey: "contents")
        coder.encode(isCurrent, forKey: "isCurrent")
    }
    
    required init?(coder: NSCoder) {
        title = coder.decodeObject(forKey: "title") as! String
        contents = coder.decodeObject(forKey: "contents") as! [String]
        isCurrent = coder.decodeBool(forKey: "isCurrent")
    }
    
}

let defaultRecipe = Recipe(title: "Default Recipe", contents: defaultPool, isCurrent: true)

let defaultPool: [String] =
    [" 麻辣香锅🥘"," 麻辣烫🌶"," 肉蟹煲🦀"," 面条🍝"," 汉堡🍔",
     " 炸鸡🍗"," 馄饨饺子🥟"," 咖喱饭🍛"," 寿司🍣"," 简餐🍱",
     " 火锅🍲"," 便利店🏪"," 蛋糕🍰"," 海鲜🦞"," 披萨🍕",
     " 牛排🥩"," 沙拉🥗"," 三明治🥪"," 烧烤🍺"," 烤肉🍖",
     " 黄焖鸡米饭🍚"," 沙县小吃🥧"," 兰州拉面🍜"," 西餐🍽"," 面包🥐"]
