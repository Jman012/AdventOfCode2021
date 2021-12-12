import Foundation

public struct Day12: Challenge {
	
	public init() {}
	
	func findNumPaths(data: [String: [String]], node: String, visited: [String], singleSmallCave: String? = nil) -> [[String]] {
		if node == "end" {
			return [visited]
		}
		
		var paths: [[String]] = []
		for next in data[node]! {
			if next == "start" {
				continue
			}
			if next == next.lowercased() {
				let numVisited = visited.filter({ $0 == next }).count
				if (singleSmallCave != next && numVisited == 1) || (singleSmallCave == next && numVisited >= 2) {
					continue
				}
			}
			
			var newVisited = visited
			newVisited.append(next)
			paths.append(contentsOf: findNumPaths(data: data, node: next, visited: newVisited, singleSmallCave: singleSmallCave))
		}
		
		return paths
	}
	
	public func solvePart1(input: String) -> String {
		let data = parse(input: input)
		let allPaths = findNumPaths(data: data, node: "start", visited: ["start"])
//		print(allPaths)
		return "\(allPaths.count)"
	}
	
	public func solvePart2(input: String) -> String {
		// Original single-threaded solution
//		let data = parse(input: input)
//
//		let allPaths = data
//			.keys
//			.filter({ $0 != "start" && $0 != "end" && $0 == $0.lowercased() })
//			.map({ findNumPaths(data: data, node: "start", visited: ["start"], singleSmallCave: $0) })
//			.flatMap({ $0 })
//		let allPathsUnique = Set(allPaths)
////		print(allPathsUnique)
//		return "\(allPathsUnique.count)"
		
		let data = parse(input: input)
		
		let allSmallCaves = data
			.keys
			.filter({ $0 != "start" && $0 != "end" && $0 == $0.lowercased() })
		var queues: [DispatchQueue] = []
		var allPathsUnique: Set<[String]> = []
		let lock1 = NSLock()
		let lock2 = NSLock()
		lock2.lock()
		var num = allSmallCaves.count
		for (index, cave) in allSmallCaves.enumerated() {
			let queue = DispatchQueue(label: "cave-\(index)", qos: .userInteractive, attributes: .concurrent)
			queues.append(queue)
			queue.async {
//				print("\(index): async and find")
				let newPaths = findNumPaths(data: data, node: "start", visited: ["start"], singleSmallCave: cave)
				lock1.lock()
//				print("\(index): locked")
				allPathsUnique.formUnion(newPaths)
				num -= 1
//				print("\(index): new num = \(num)")
				if num == 0 {
//					print("\(index): unlock lock2")
					lock2.unlock()
				}
				lock1.unlock()
			}
		}
//		print("lock2: wait")
		lock2.lock()
//		print("lock2: waited")
//		let allPathsUnique = Set(allPaths)
//		print(allPathsUnique)
		return "\(allPathsUnique.count)"
	}
	
	func parse(input: String) -> [String: [String]] {
		let lines = input
			.split(separator: "\n")
			.map({ line -> (String, String) in
				let a = line.split(separator: "-")
				return (String(a[0]), String(a[1]))
			})
		var result: [String: [String]] = [:]
		for line in lines {
			if var val = result[line.0] {
				val.append(line.1)
				result[line.0] = val
			} else {
				result[line.0] = [line.1]
			}
			
			if var val = result[line.1] {
				val.append(line.0)
				result[line.1] = val
			} else {
				result[line.1] = [line.0]
			}
		}
		return result
	}
}
