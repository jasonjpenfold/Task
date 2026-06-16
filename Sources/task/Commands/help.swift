// jjp 15/6/26
// help

extension TaskRunner{
	func help(){
		print("Help is on the way dear!\n")
		print("TaskManager Commands:")
		print("Usage:")
		print("task add \"task name\"")
		print("task edit <task number> \"new task name\"")
		print("task list")
		print("task pending")
		print("task remove <task number>")
		print("task complete <task number>")
		print("task uncomplete <task number>")
		print("task sort <sort type> (sort type: a, z, createdOn, completed)")
		print("task search <search term>")
		print("task clear")
		print("task help")
		print()
	}
}
