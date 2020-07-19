//
//  Food.swift
//  WhatToEat
//
//  Created by 吉乞悠 on 2020/7/18.
//  Copyright © 2020 mimosa. All rights reserved.
//

import Foundation

struct Food {
    
    let name: String
    
}

extension Food: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func != (lhs: Self, rhs: Self) -> Bool {
        return lhs.name != rhs.name
    }
}
