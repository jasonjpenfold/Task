//listItems

extension TaskRunner{

	func listItems(){
		print("Task list:")

		let taskList: String = self.tasksModel.tasks.enumerated().map{index, element in "\(index + 1). [\(element.completed ? "x" : " ")] \(element.name)"}.joined(separator:"\n")
		
		print(taskList)

		print("End of task list.")
	}
}
