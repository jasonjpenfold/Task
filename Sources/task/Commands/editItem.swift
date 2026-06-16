extension TaskRunner{
    mutating func editItem(commandArgs: [String]){
        if commandArgs.count < 3{
            print("Error: Unable to edit task.")
            return
        }
        guard let input = Int(commandArgs[1]) else{
            print("Error: Task number needed.")
            return
        }
        let taskIndex = input - 1
        let newName = commandArgs[2]
        let edited = self.tasksModel.editTask(taskIndex: taskIndex, newName: newName)
        if !edited {
            print("Unable to edit task.")
            return
        }else{
            self.tasksModel.saveTasks()
            print("Task edited.")
        }
    }
}