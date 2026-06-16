extension TaskRunner{
    mutating func searchItem(commandArgs: [String]){
        if commandArgs.count < 2{
            print("Error: Unable to search tasks.")
            return
        }
        let searchTerm = commandArgs[1]
        let searchResults = self.tasksModel.searchTasks(searchTerm:searchTerm)
        if searchResults.isEmpty{
            print("No tasks found matching the search term.")
            return
        }
        print("Search results:")
        for (index, task) in searchResults.enumerated() {
            print("\(index + 1). \(task.name) - \(task.completed ? "[x]" : "[ ]")")
        }
    }
}