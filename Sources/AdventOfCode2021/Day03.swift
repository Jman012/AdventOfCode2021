import Foundation

struct Day03: Challenge {
	
	func solvePart1(input: String) -> String {
		let instrs = parse(input: input)
		return ""
	}
	
	func solvePart2(input: String) -> String {
		let instrs = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> [Int] {
		return input
			.split(separator: "\n")
			.map({ line in
				Int(line) ?? 0
			})
	}
}
