// jjp 14-6-26
// remove items 

extension TaskRunner{
	mutating func removeItems(commandArgs: [String]){
	if commandArgs.count < 2{
		print("Error: Need task number.")
		return
	}
		guard let input = Int(commandArgs[1])  else{
			
			print("Error: Invalid task number")
			return
		}
		let taskIndex = input - 1
		let removedSuccess: Bool = self.tasksModel.removeTask(taskIndex: taskIndex)
		print(removedSuccess ? "Task removed successfully." : "Error: Unable to remove task")	

		self.tasksModel.saveTasks()
	}
}
