extension TaskRunner{
    func exportItems(commandArgs: [String]){
        let exportSuccess = self.tasksModel.exportTasks()
        if !exportSuccess{
            print("Unable to export tasks.")
            return
        }
        print("Tasks exported successfully.")
    }
}