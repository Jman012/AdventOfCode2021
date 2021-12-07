import Foundation

public struct Day07Optimized: Challenge {
	
	public init() {}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		
		var horizontalFuels: [Int] = [Int](repeating: 0, count: lines.max()! + 1)
		for horizontal in lines.min()!...lines.max()! {
			horizontalFuels[horizontal] = lines.map({ abs($0 - horizontal) }).reduce(0, +)
		}
		let minFuel = horizontalFuels.map({ $0 }).min()!
		return "\(minFuel)"
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		
		var horizontalFuels: [Int] = [Int](repeating: 0, count: lines.max()! + 1)
		for horizontal in lines.min()!...lines.max()! {
			horizontalFuels[horizontal] = lines.map({ line in
				let distance = abs(line - horizontal)
//				let fuel = (0...distance).reduce(0, +)
				let fuel = (distance * (distance + 1)) / 2
				return fuel
			}).reduce(0, +)
		}
		let minFuel = horizontalFuels.map({ $0 }).min()!
		return "\(minFuel)"
	}
	
	func parse(input: String) -> [Int] {
		return input
			.split(separator: ",")
			.map({
				Int($0)!
			})
	}
}
