// add item

import Foundation

extension TaskRunner{
	mutating func addItem(commandArgs: [String]){
		if commandArgs.count < 2 {
			print("Task Manager: error - No item")
			return
		}
		let name = commandArgs[1]
		self.tasksModel.addTask(name: name)

		print("\(name) added to task list.")

		self.tasksModel.saveTasks()
	}
}
