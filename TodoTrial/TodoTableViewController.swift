//
//  TodoTableViewController.swift
//  TodoTrial
//
//  Created by Abhishek Kambli on 25/03/18.
//  Copyright © 2018 Abhishek Kambli. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
	
	var todos: [Todo] = []
	var position: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
		
		let todo = todos[indexPath.row]
		
		if todo.isImportant
		{
			cell.textLabel?.text = "❗️ \(todo.name)"
			cell.textLabel?.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
		}
		else
		{
			cell.textLabel?.text = todo.name
			cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		}

        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let todo = todos[indexPath.row]
		position = indexPath.row
		performSegue(withIdentifier: "showTodoSegue", sender: todo)
		
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if let addVC = segue.destination as? AddTodoViewController {
			addVC.todoRefVC = self
		}
		
		if let showVC = segue.destination as? ShowTodoViewController {
		
			
			if let todo = sender as? Todo {
				showVC.selectedTodo = todo
				showVC.refVC = self
			}
			
		}
	}
	
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
