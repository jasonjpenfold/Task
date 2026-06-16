extension TaskRunner{
    mutating func uncompleteItem(commandArgs: [String]){
        if commandArgs.count < 2{
            print("Error: Unable to uncomplete task.")
        }
        guard let taskNumber: Int = getTaskNumber(taskNumberString: commandArgs[1]) else{
            return
        }
        let taskIndex = taskNumber - 1
        let uncompleted = self.tasksModel.uncompleteTask(taskIndex: taskIndex)
        if !uncompleted{
            print("Unable to uncomplete task.")
            return
        }
        print("Task uncompleted.")
        self.tasksModel.saveTasks()

    }
}