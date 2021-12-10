import Foundation

public struct Day10: Challenge {
	
	public init() {}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	public func solvePart2(input: String) -> String {
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
