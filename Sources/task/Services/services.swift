// jjp 13-6-26
// json services

import Foundation

struct JsonService{
 

	static func importTasks<T: Codable>(filename: String)throws->[T]{
		let fileManager = FileManager.default
		let homeDirURL = fileManager.homeDirectoryForCurrentUser
		let directory = homeDirURL.appendingPathComponent(".taskcli")
		
		
		let fileURL = directory.appendingPathComponent(filename)

		if !fileManager.fileExists(atPath: fileURL.path){
			try fileManager.createDirectory(at: directory, withIntermediateDirectories: true)
			return []
		}
		let jsonDecoder = JSONDecoder()

		let jsonData = try Data(contentsOf:fileURL)
		let data = try jsonDecoder.decode([T].self, from: jsonData)
		return data
	}

	static func exportTasks<T: Codable>(filename: String, data: [T])throws{
		let fileManager = FileManager.default
		
		let homeDirURL = fileManager.homeDirectoryForCurrentUser                
		let directory = homeDirURL.appendingPathComponent(".taskcli")                                                
		let fileURL = directory.appendingPathComponent(filename)

		let jsonEncoder = JSONEncoder()
		
		let jsonData = try jsonEncoder.encode(data)
		try jsonData.write(to: fileURL)
	}
}

struct TextService{
	static func exportTasksAsText(filename: String, data: [String])throws{
		let fileManager = FileManager.default
		
		let homeDirURL = fileManager.homeDirectoryForCurrentUser                
		                                                
		let fileURL = homeDirURL.appendingPathComponent(filename)

		let textData = data.joined(separator: "\n")
		try textData.write(to: fileURL, atomically: true, encoding: .utf8)
	}
}
