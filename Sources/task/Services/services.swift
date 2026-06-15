// jjp 13-6-26
// json services

import Foundation

struct JsonService{
 

	static func importTasks<T: Codable>(filename: String)throws->[T]{
		let fileManager = FileManager.default
		let currentDirPath = fileManager.currentDirectoryPath
		let fileURL = URL(fileURLWithPath: currentDirPath).appendingPathComponent(filename)

		if !fileManager.fileExists(atPath: fileURL.path){
			return []
		}
		let jsonDecoder = JSONDecoder()

		let jsonData = try Data(contentsOf:fileURL)
		let data = try jsonDecoder.decode([T].self, from: jsonData)
		return data
	}

	static func exportTasks<T: Codable>(filename: String, data: [T])throws{
		let fileManager = FileManager.default
		let currentDirPath = fileManager.currentDirectoryPath
		let fileURL = URL(fileURLWithPath: currentDirPath).appendingPathComponent(filename)

		let jsonEncoder = JSONEncoder()
		
		let jsonData = try jsonEncoder.encode(data)
		try jsonData.write(to: fileURL)
	}
}
