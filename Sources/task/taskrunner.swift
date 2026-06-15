// jjp

import Foundation

struct TaskRunner{
	var tasksModel = TasksModel()


	mutating func run(){
		

		let command = CommandLine.arguments[1].lowercased()

		switch command{
			case "add":
			addItem()
			
			case "list":
			listItems()
			
			case "clear":
			clearItems()
			
			case "remove":
			removeItems()
			
			case "complete":
			print("Completing....")
			case "help":
			print("Help is on the way dear!")
			default:
			print("Task Manager: error - No command given")
		}
	}
}
