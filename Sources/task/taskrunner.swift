// jjp

import Foundation

enum Command: String{
	case add
	case edit
	case list
	case pending
	case clear
	case remove
	case complete
	case uncomplete
	case help
	
}

struct TaskRunner{
	var tasksModel = TasksModel()


	mutating func run(commandArgs: [String]){
		

		guard let command: Command = Command(rawValue: commandArgs[0]) else {
			print("TaskManager: error - Invalid command given")
			return
		}

		switch command{
			case .add:
			addItem(commandArgs: commandArgs)

			case .edit:
			editItem(commandArgs: commandArgs)
			
			case .list:
			listItems()

			case .pending:
			pendingItems()
			
			case .clear:
			clearItems()
			
			case .remove:
			removeItems(commandArgs: commandArgs)
			
			case .complete:
			completeItem(commandArgs: commandArgs)
			
			case .uncomplete:
			uncompleteItem(commandArgs: commandArgs)
			
			case .help:
			help()
		
		}
	}
}
