import Foundation

protocol Challenge {
	func solvePart1(input: String)
	func solvePart2(input: String)
}

extension String {
	func parseLinesToInts() -> [Int] {
		return self
			.split(separator: "\n")
			.map({ Int($0)! })
	}
}
