// jjp 12-6-26
// task -  Task Manager for  pi5 using swift
import Foundation

@main
struct task {
    static func main() {
        if CommandLine.arguments.count < 2{
        	print("Task Manager: error - command not specified")
        }else{
        var taskRunner = TaskRunner()
        	taskRunner.run()
        	
        }
    }
}
