// jjp

import Foundation

enum Command: String{
	case add
	case list
	case clear
	case remove
	case complete
	case help
	
}

struct TaskRunner{
	var tasksModel = TasksModel()


	mutating func run(){
		

		guard let command: Command = Command(rawValue: CommandLine.arguments[1].lowercased()) else {
			print("TaskManager: error - Invalid command given")
			return
		}

		switch command{
			case .add:
			addItem()
			
			case .list:
			listItems()
			
			case .clear:
			clearItems()
			
			case .remove:
			removeItems()
			
			case .complete:
			completeItem()
			
			case .help:
			help()
		
		}
	}
}
