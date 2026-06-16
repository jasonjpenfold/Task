extension TaskRunner{
    func getTaskNumber(taskNumberString: String)->Int?{
        guard let taskNumber: Int = Int(taskNumberString) else{
            print("Error: Invalid task number.")
            return nil
        }
        return taskNumber
    }
}