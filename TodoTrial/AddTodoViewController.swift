//
//  AddTodoViewController.swift
//  TodoTrial
//
//  Created by Abhishek Kambli on 25/03/18.
//  Copyright © 2018 Abhishek Kambli. All rights reserved.
//

import UIKit



class AddTodoViewController: UIViewController {
	
	@IBOutlet weak var input: UITextField!
	
	@IBOutlet weak var isImportantSwitch: UISwitch!
	
	@IBOutlet weak var addTodoButton: UIButton!
	
	var todoRefVC = TodoTableViewController()
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		input.becomeFirstResponder()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }

	@IBAction func tappedAddButton(_ sender: UIButton) {
		
		let withImportance = isImportantSwitch.isOn
		let todo = Todo()
		
		if let title = input.text {
			todo.name = title
		}
		
		todo.isImportant = withImportance
		
		todoRefVC.todos.append(todo)
		todoRefVC.tableView.reloadData()
		navigationController?.popViewController(animated: true)
		
		print(todoRefVC.todos)
		
		
	}
	
	
	override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
