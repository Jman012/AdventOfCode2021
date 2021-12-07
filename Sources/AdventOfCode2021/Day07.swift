import Foundation

struct Day07: Challenge {
	
	func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		
		var horizontalFuels: [Int: Int] = [:]
		for horizontal in lines.min()!...lines.max()! {
			horizontalFuels[horizontal] = lines.map({ abs($0 - horizontal) }).reduce(0, +)
		}
		let minFuel = horizontalFuels.map({ $0.value }).min()!
		return "\(minFuel)"
	}
	
	func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		
		var horizontalFuels: [Int: Int] = [:]
		for horizontal in lines.min()!...lines.max()! {
			horizontalFuels[horizontal] = lines.map({ line in
				let distance = abs(line - horizontal)
//				let fuel = (0...distance).reduce(0, +)
				let fuel = (distance * (distance + 1)) / 2
				return fuel
			}).reduce(0, +)
		}
		let minFuel = horizontalFuels.map({ $0.value }).min()!
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
