// jjp 14-6-26
// clearItems  

extension TaskRunner{
	mutating func clearItems(){
		self.tasksModel.clearTasks()
		self.tasksModel.saveTasks()
		print("Tasks cleared.")
	}
}
