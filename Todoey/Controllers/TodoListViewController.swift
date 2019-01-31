//
//  ViewController.swift
//  Todoey
//
//  Created by ESK on 28/01/19.
//  Copyright © 2019 indiana99. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
//    var itemArray = ["Prepare Umrah", "Find my Match", "Prepare Wedding", "Prepare Hajj", "Build my House", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    var itemArray = [Item]()
    let defauls = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "make today agenda"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "breath exercise"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "take a bath"
        itemArray.append(newItem3)
        
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defauls.array(forKey: "ToDoListArray") as? [Item] {
//            itemArray = items
//        }
    }
    
    // MARK -TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        print("cellForRowAtIndexPath called")
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell ")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
//        cell.textLabel?.text = itemArray[indexPath.row]
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            what will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
            
//            self.itemArray.append(textField.text!)
            
//            self.defauls.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Todoey item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}

