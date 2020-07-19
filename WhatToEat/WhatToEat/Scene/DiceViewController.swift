//
//  DiceViewController.swift
//  WhatToEat
//
//  Created by CM on 2020/7/17.
//  Copyright © 2020 mimosa. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var diceButton: UIButton!
    
    var model = WhatToEat()
    
    var timer: Timer?
}

// MARK: - Work Flow
extension DiceViewController {
    func changeText(with randomFood: String) {
        textLabel.text = randomFood
    }
    
    func endTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.changeText(with: self.model.getRandomResult().name)
        })
    }
}


// MARK: - Target Actions
extension DiceViewController {
    @IBAction func diceButtonDidTouchDown(_ sender: DiceButton) {
        startTimer()
    }
    
    @IBAction func diceButtonDidTouchUpInside(_ sender: DiceButton) {
        endTimer()
    }
    
    @IBAction func diceButtonDidTouchExit(_ sender: DiceButton) {
        endTimer()
    }
    
    @IBAction func diceButtonDidTouchCancel(_ sender: DiceButton) {
        endTimer()
    }
}

