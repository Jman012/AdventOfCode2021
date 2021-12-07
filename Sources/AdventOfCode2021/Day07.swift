import Foundation

struct Day07: Challenge {
	
	func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> [Int] {
		return input
			.split(separator: "\n")
			.map({
				Int($0)!
			})
	}
}
