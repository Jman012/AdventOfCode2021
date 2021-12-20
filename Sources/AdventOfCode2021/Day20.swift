import Foundation

public struct Day20: Challenge {
	
	public init() {}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> [[Vec]] {
		return input
			.components(separatedBy: "\n")
			.map({ Int($0)! })
	}
}
