//
//  RecipeList.swift
//  WhatToEat
//
//  Created by CM on 2020/7/20.
//  Copyright © 2020 mimosa. All rights reserved.
//

import Foundation

class RecipeList: NSObject, NSCoding {
    
    var recipes: [Recipe] = []
    var currentRecipe: Recipe!
    
    override init() {
        super.init()
    }
    
    func updateCurrentRecipe() {
        for recipe in recipes {
            if recipe.isCurrent {
                currentRecipe = recipe
            }
        }
    }
    
    func append(_ recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(recipes, forKey: "recipes")
    }
    
    required init?(coder: NSCoder) {
        super.init()
        recipes = coder.decodeObject(forKey: "recipes") as! [Recipe]
        updateCurrentRecipe()
    }
    
}
