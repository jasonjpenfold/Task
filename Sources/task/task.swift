// jjp 12-6-26
// task -  Task Manager for  pi5 using swift
import Foundation

@main
struct task {
    static func main() {
        let commandLineArgs: [String] = Array(CommandLine.arguments.dropFirst())
        if commandLineArgs.isEmpty{
        	print("Task Manager: error - command not specified")
        }else{
        var taskRunner = TaskRunner()
        	taskRunner.run(commandArgs: commandLineArgs)
        	
        }
    }
}
