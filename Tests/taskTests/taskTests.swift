import XCTest
@testable import task

final class TaskTests: XCTestCase {
    var tasksModel: TasksModel!

    override func setUp(){
        tasksModel = TasksModel(filename: "test_tasks.json")
    }

    override func tearDown(){
        tasksModel = nil

        let filename = "test_tasks.json"
        let fileManager = FileManager.default
		let homeDirURL = fileManager.homeDirectoryForCurrentUser
		let directory = homeDirURL.appendingPathComponent(".taskcli")
		
		
		let fileURL = directory.appendingPathComponent(filename)
        do{
		if fileManager.fileExists(atPath: fileURL.path){
			try fileManager.removeItem(at: fileURL)
		}
        }catch{
            print("Error removing test file: \(error)")
        }


    }



func testAddTask(){

    
    // Test implementation for adding a task
    
    let originalCount = tasksModel.tasks.count
    XCTAssertEqual(originalCount, 0, "Expected 0 tasks initially") // Assuming the test file starts empty

    tasksModel.addTask(name: "Test task")
    XCTAssertEqual(tasksModel.tasks.count, originalCount + 1, "Expected 1 task after adding")

    XCTAssertEqual(tasksModel.tasks[0].name, "Test task", "Expected task name to match")

    XCTAssertFalse(tasksModel.tasks[0].completed, "Expected task to be incomplete initially")

    XCTAssertNotNil(tasksModel.tasks[0].createdOn, "Expected task to have a creation date")
    

}
func testCompleteTask(){
    let taskName = "Complete this task"
    tasksModel.addTask(name: taskName)
    let taskIndex = 0 // Assuming it's the first task added
    tasksModel.completeTask(taskIndex: taskIndex)
    
    XCTAssertTrue(tasksModel.tasks[taskIndex].completed, "Expected task to be completed")
}

func testUncompleteTask(){
    let taskName = "Uncomplete this task"
    tasksModel.addTask(name: taskName)
    let taskIndex = 0 // Assuming it's the first task added
    tasksModel.completeTask(taskIndex: taskIndex)
    XCTAssertTrue(tasksModel.tasks[taskIndex].completed, "Expected task to be completed")

    tasksModel.uncompleteTask(taskIndex: taskIndex)
    XCTAssertFalse(tasksModel.tasks[taskIndex].completed, "Expected task to be uncompleted")
}
func testEditTask(){
    let taskName = "Original task name"
    tasksModel.addTask(name: taskName)
    let taskIndex = 0 // Assuming it's the first task added
    let newTaskName = "Edited task name"
    tasksModel.editTask(taskIndex: taskIndex, newName: newTaskName)
    XCTAssertEqual(tasksModel.tasks[taskIndex].name, newTaskName, "Expected task name to be updated after editing")
}
func testRemoveTask(){
    let taskName = "Task to be removed"
    tasksModel.addTask(name: taskName)
    let taskIndex = 0 // Assuming it's the first task added
    let originalCount = tasksModel.tasks.count
    XCTAssertEqual(originalCount, 1, "Expected 1 task before removal")

    let removed = tasksModel.removeTask(taskIndex: taskIndex)
    XCTAssertTrue(removed, "Expected task to be removed successfully")
    XCTAssertEqual(tasksModel.tasks.count, originalCount - 1, "Expected task count to decrease after removal")
}
func testCheckTaskIndex(){
    let taskName = "Task for index check"
    tasksModel.addTask(name: taskName)
    let validIndex = 0
    let invalidIndex = 1 // Out of bounds
    XCTAssertTrue(tasksModel.checkTaskIndex(taskIndex: validIndex), "Expected valid index to be checked successfully")
    XCTAssertFalse(tasksModel.checkTaskIndex(taskIndex: invalidIndex), "Expected invalid index to be checked unsuccessfully")
}
func testClearTasks(){
    tasksModel.addTask(name: "Task 1")
    tasksModel.addTask(name: "Task 2")
    XCTAssertEqual(tasksModel.tasks.count, 2, "Expected 2 tasks before clearing")

    tasksModel.clearTasks()
    XCTAssertEqual(tasksModel.tasks.count, 0, "Expected 0 tasks after clearing")
}
func testPendingTasks(){
    tasksModel.addTask(name: "Task 1")
    tasksModel.addTask(name: "Task 2")
    XCTAssertEqual(tasksModel.pendingTasks().count, 2, "Expected 2 pending tasks")

    tasksModel.completeTask(taskIndex: 0)
    XCTAssertEqual(tasksModel.pendingTasks().count, 1, "Expected 1 pending task after completing one")

    tasksModel.uncompleteTask(taskIndex: 0)
    XCTAssertEqual(tasksModel.pendingTasks().count, 2, "Expected 2 pending tasks after uncompleting one")
}

}