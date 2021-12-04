import Foundation

struct Day04: Challenge {
	
	func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	func solvePart2(input: String) -> String {
		var lines = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> [String] {
		return input
			.split(separator: "\n")
			.map({ String($0) })
	}
}
