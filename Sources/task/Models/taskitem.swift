// taskitem struct to store the tasks

import Foundation

struct TaskItem: Identifiable, Codable{
	var id: UUID = UUID()
	var name: String
	var completed: Bool = false
	var createdOn: Date = Date()
}
