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
    var currentRecipe: Recipe {
        get {
            for recipe in recipes {
                if recipe.isCurrent {
                    return recipe
                }
            }
            return defaultRecipe
        }
    }
    
    override init() {
        super.init()
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
    }
    
}
