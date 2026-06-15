// jjp 15-6-26
// completeItem

extension TaskRunner{
	mutating func completeItem(){
		if CommandLine.arguments.count < 3{
			print("Error: Unable to complete task.")
		}
		guard let input = Int(CommandLine.arguments[2]) else{
			print("Error: Task number needed")
			return
		}
		let taskIndex = input - 1
		let completed = self.tasksModel.completeTask(taskIndex: taskIndex)
		if !completed{
			print("Unable to complete task!")
		}else{
			print("Task completed.")
		}
		self.tasksModel.saveTasks()
	}
}
