//
//  RecipeViewController.swift
//  WhatToEat
//
//  Created by 吉乞悠 on 2020/7/18.
//  Copyright © 2020 mimosa. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
    }

}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell")!
        cell.textLabel?.text = "My Recipe"
        cell.detailTextLabel?.text = "ksdfhvbkdasfbv,csufviadufbauid,asfkdabvfgkbds,adfvubesys,asasfdsfdasdf"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "删除") { (action, view, finished) in
            //self.titles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            finished(true)
        }
        let archiveAction = UIContextualAction(style: .normal, title: "编辑") { (action, view, finished) in
            
            print(1)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction, archiveAction])
    }
}
