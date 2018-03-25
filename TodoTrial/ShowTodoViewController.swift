//
//  ShowTodoViewController.swift
//  TodoTrial
//
//  Created by Abhishek Kambli on 25/03/18.
//  Copyright © 2018 Abhishek Kambli. All rights reserved.
//

import UIKit

class ShowTodoViewController: UIViewController {

	@IBOutlet weak var todoLabel: UILabel!
	var refVC =  TodoTableViewController()
	var selectedTodo =  Todo()
	var selectedTodoPosition: Int = 0
	
	override func viewDidLoad() {
        super.viewDidLoad()

        todoLabel.text = selectedTodo.name
		selectedTodoPosition = refVC.position
    }
	@IBAction func tappedDoneBtn(_ sender: UIButton) {
		refVC.todos.remove(at: selectedTodoPosition)
		refVC.tableView.reloadData()
		navigationController?.popViewController(animated: true)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
