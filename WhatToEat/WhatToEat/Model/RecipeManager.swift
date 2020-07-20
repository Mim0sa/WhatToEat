//
//  RecipeManager.swift
//  WhatToEat
//
//  Created by CM on 2020/7/20.
//  Copyright © 2020 mimosa. All rights reserved.
//

import Foundation

class RecipeManager {
    
    static let shared = RecipeManager()
    
    static var sharedRecipeList: RecipeList! {
        didSet {
            RecipeManager.sharedRecipeList.updateCurrentRecipe()
        }
    }
     
    private init() {}
    
    func getAllRecipes() {
        let recipes = RecipeList()
        if getList().isEmpty {
            writeRecipe(recipe: defaultRecipe)
            recipes.append(defaultRecipe)
        } else {
            for title in getList() { recipes.append(readRecipe(title: title)!) }
        }
        RecipeManager.sharedRecipeList = recipes
    }
    
    func isRecipeExist(title: String) -> Bool {
        if FileManager.default.fileExists(atPath: getDocumentsDirectory().path) {
            return true
        } else {
            return false
        }
    }
    
    func writeRecipe(recipe: Recipe) {
        let fullPath = getDocumentsDirectory().appendingPathComponent(recipe.title)

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: recipe, requiringSecureCoding: false)
            try data.write(to: fullPath)
        } catch {
            print("Couldn't write file")
        }
    }
    
    func readRecipe(title: String) -> Recipe? {
        let fullPath = getDocumentsDirectory().appendingPathComponent(title)
        var recipe: Recipe?
        
        do {
            recipe = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(Data(contentsOf: fullPath)) as? Recipe
        } catch {
            print("Couldn't read file.")
        }
        
        return recipe
    }
    
    func deleteRecipe(title: String) -> Bool {
        let fullPath = getDocumentsDirectory().appendingPathComponent(title)
        do {
            try FileManager.default.removeItem(at: fullPath)
            return true
        } catch {
            return false
        }
    }
    
    func getList() -> [String] {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileList = try? FileManager.default.contentsOfDirectory(atPath: url.path)
        return fileList ?? []
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
