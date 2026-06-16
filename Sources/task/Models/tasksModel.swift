		// jjp 14.6.26
// tasksModel - tasks store and business logic

import Foundation

struct TasksModel: Codable{
	private(set) var tasks:[TaskItem]
	
	init(){
		do{
			self.tasks = try JsonService.importTasks(filename: "tasks.json")
		}catch{
			print("Import error: \(error)")
			self.tasks = []
		}
	}

	mutating func addTask(name: String){
		self.tasks.append(TaskItem(name: name))
	}

	func checkTaskIndex(taskIndex: Int)->Bool{
		return taskIndex >= 0 && taskIndex < self.tasks.endIndex
	}

	mutating func removeTask(taskIndex: Int)->Bool{
		if !checkTaskIndex(taskIndex: taskIndex){
			return false
		}
		self.tasks.remove(at: taskIndex)
		return true
	}
	func pendingTasks()->[TaskItem]{

		return self.tasks.filter{!$0.completed}
	}
	func saveTasks(){
		do{
			try JsonService.exportTasks(filename: "tasks.json", data: self.tasks)
		}catch{
			print("Export error: \(error)")
		}
	}
	mutating func clearTasks(){
		self.tasks.removeAll()
	}
	mutating func completeTask(taskIndex: Int)->Bool{
		if !checkTaskIndex(taskIndex: taskIndex){
			return false
		}
		self.tasks[taskIndex].completed = true
		return true
	}
	mutating func editTask(taskIndex: Int, newName: String)->Bool{
		if !checkTaskIndex(taskIndex: taskIndex){
			return false
		}
		self.tasks[taskIndex].name = newName
		return true
	}
	mutating func uncompleteTask(taskIndex: Int)->Bool{
		if !checkTaskIndex(taskIndex: taskIndex){
			return false
		}
		self.tasks[taskIndex].completed = false
		return true
	}
	mutating func sortTasks(sortType: String)->Bool{
		switch sortType{
			case "a":
				self.tasks.sort{ $0.name.lowercased() < $1.name.lowercased() }
				return true
			case "z":
				self.tasks.sort{ $0.name.lowercased() > $1.name.lowercased() }
				return true
			case "created":
				self.tasks.sort{ $0.createdOn < $1.createdOn }
				return true
			case "completed":
				self.tasks.sort{ $0.completed && !$1.completed }
				return true
			default:
				return false
			
		}
	}
	func searchTasks(searchTerm: String)->[TaskItem]{
		return self.tasks.filter{ $0.name.localizedCaseInsensitiveContains(searchTerm) }
	}

	func exportTasks()->Bool{
		let exportFilename = "tasks_export.txt"
		let tasksAsText = self.tasks.enumerated().map{ index,element in "Task \(index + 1): \(element.name) - \(element.completed ? "[x]" : "[ ]") - created on \(element.createdOn.formatted(date: .long, time: .shortened))" }

		do{
			try TextService.exportTasksAsText(filename: exportFilename, data: tasksAsText)
			return true
		}catch{
			print("Export error: \(error)")
			return false
		}
	}
}
