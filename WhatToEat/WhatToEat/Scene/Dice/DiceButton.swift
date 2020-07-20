//
//  DiceButton.swift
//  WhatToEat
//
//  Created by CM on 2020/7/17.
//  Copyright © 2020 mimosa. All rights reserved.
//

import UIKit

class DiceButton: UIButton {
    
    override var isHighlighted: Bool {
        willSet {
            backgroundColor = newValue ? #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setTitle("长按开始", for: .normal)
        setTitle("松手结束", for: .highlighted)
        
        layer.cornerRadius = 75
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
    }

}
