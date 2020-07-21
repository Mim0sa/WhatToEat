//
//  RecipeViewController.swift
//  WhatToEat
//
//  Created by CM on 2020/7/20.
//  Copyright © 2020 mimosa. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBAction func baBtnDidClickCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func barBtnDidClickDone(_ sender: UIBarButtonItem) {
        RecipeManager.shared.writeRecipe(recipe: Recipe(title: "\(Int.random(in: 0...100))", contents: defaultRecipe.contents, isCurrent: false))
        dismiss(animated: true, completion: nil)
    }
    
}
