//listItems

extension TaskRunner{

	func listItems(){
	print("Task list:")
		let taskList = self.tasksModel.listTasks()
		print(taskList)
		print("End of task list.")
	}
}
