// add item

import Foundation

extension TaskRunner{
	mutating func addItem(){
		if CommandLine.arguments.count < 3 {
			print("Task Manager: error - No item")
			return
		}
		let name = CommandLine.arguments[2]
		self.tasksModel.addTask(name: name)

		print("\(name) added to task list.")

		self.tasksModel.saveTasks()
	}
}
