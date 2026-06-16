extension TaskRunner{
    func pendingItems(){
        let pendingList: String = self.tasksModel.pendingTasks().enumerated().map{index, element in "\(index + 1). [ ] \(element.name)"}.joined(separator:"\n")

        print("Pending task list")
        print(pendingList)
        print("End of pending list")
    }
}