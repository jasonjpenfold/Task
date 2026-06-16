extension TaskRunner{
    mutating func sortItem(commandArgs: [String]){
        if commandArgs.count < 2{
            print("Error: Unable to sort tasks.")
            return
        }
        let sortType = commandArgs[1]
        let sorted = self.tasksModel.sortTasks(sortType:sortType)
        if !sorted{
            print("Unable to sort tasks.")
            return
        }
        print("Tasks sorted.")
        listItems()
        self.tasksModel.saveTasks()

    }
}