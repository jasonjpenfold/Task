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
		return taskIndex > 0 && taskIndex < self.tasks.endIndex
	}

	mutating func removeTask(taskIndex: Int)->Bool{
		if !checkTaskIndex(taskIndex: taskIndex){
			return false
		}
		self.tasks.remove(at: taskIndex)
		return true
	}
	func listTasks()->String{

		return self.tasks.enumerated().map{index, element in "\(index + 1). \(element.name)"}.joined(separator:"\n")
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
}
