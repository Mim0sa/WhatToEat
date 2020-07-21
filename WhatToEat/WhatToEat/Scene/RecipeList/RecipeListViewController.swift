//
//  RecipeViewController.swift
//  WhatToEat
//
//  Created by 吉乞悠 on 2020/7/18.
//  Copyright © 2020 mimosa. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    var list: RecipeList = RecipeManager.sharedRecipeList

    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        RecipeManager.shared.getAllRecipes()
        recipeTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        RecipeManager.shared.writeAllRecipes(recipeList: list)
    }
    
}

extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell")!
        cell.textLabel?.text = list.recipes[indexPath.row].title
        cell.detailTextLabel?.text = list.recipes[indexPath.row].contents.joined()
        if list.recipes[indexPath.row].isCurrent { cell.accessoryType = .checkmark }
        else { cell.accessoryType = .none }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for r in list.recipes { r.isCurrent = false }
        list.recipes[indexPath.row].isCurrent = true
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "删除") { (action, view, finished) in
            print(RecipeManager.shared.deleteRecipe(title: self.list.recipes[indexPath.row].title))
            self.list.recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            finished(true)
        }
        let archiveAction = UIContextualAction(style: .normal, title: "编辑") { (action, view, finished) in
            
            finished(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction, archiveAction])
    }
    
    
}
