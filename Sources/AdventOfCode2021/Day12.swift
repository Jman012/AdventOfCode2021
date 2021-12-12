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
		let data = parse(input: input)
		
		let allPaths = data
			.keys
			.filter({ $0 != "start" && $0 != "end" })
			.map({ findNumPaths(data: data, node: "start", visited: ["start"], singleSmallCave: $0) })
			.flatMap({ $0 })
		let allPathsUnique = Set(allPaths)
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
