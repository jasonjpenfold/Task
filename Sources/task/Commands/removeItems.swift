// jjp 14-6-26
// remove items 

extension TaskRunner{
	mutating func removeItems(){
		guard let input = Int(CommandLine.arguments[2])  else{
			
			print("Error: Invalid task number")
			return
		}
		let taskIndex = input - 1
		let removedSuccess: Bool = self.tasksModel.removeTask(taskIndex: taskIndex)
		print(removedSuccess ? "Task removed successfully." : "Error: Unable to remove task")	

		self.tasksModel.saveTasks()
	}
}
