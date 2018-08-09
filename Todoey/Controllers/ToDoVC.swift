//
//  ToDoVC.swift
//  Todoey
//
//  Created by Mohd Adam on 08/08/2018.
//  Copyright © 2018 Mohd Adam. All rights reserved.
//

import UIKit

class ToDoVC: UITableViewController {
    
    var itemArray = [Items]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Items()
        newItem.title = "Neymar"
        itemArray.append(newItem)
        
        let newItem2 = Items()
        newItem2.title = "Ronaldo"
        itemArray.append(newItem2)
        
        let newItem3 = Items()
        newItem3.title = "Messi"
        itemArray.append(newItem3)
        
        
        if let items = UserDefaults.standard.array(forKey: "ToDoArrayKey") {

        itemArray = items as! [Items]

        }
        
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

         //Configure the cell...
        
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title

        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])
        
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        } else {
            itemArray[indexPath.row].done = false
        }

        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
 
    @IBAction func barButtonItem(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add alert to Todoey", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newItem = Items()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoArrayKey")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Add Item"

            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

























