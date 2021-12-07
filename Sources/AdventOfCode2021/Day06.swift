import Foundation

public struct Day06: Challenge {
	
	public init() {}
	
	class FishGroup {
		var age: Int
		var count: Int
		
		var description: String {
			"\(age): \(count)"
		}
		
		init(age: Int, count: Int) {
			self.age = age
			self.count = count
		}
	}
	
	public func solvePart1(input: String) -> String {
		return solve(input: input, days: 80)
	}
	
	public func solvePart2(input: String) -> String {
		return solve(input: input, days: 256)
	}
	
	func solve(input: String, days: Int) -> String {
		let fishAges = parse(input: input)
		
		var fishAgeGroups: [FishGroup] = []
		for fishAge in fishAges {
			if let group = fishAgeGroups.first(where: { $0.age == fishAge }) {
				group.count += 1
			} else {
				fishAgeGroups.append(FishGroup(age: fishAge, count: 1))
			}
		}
		
//		print(fishAgeGroups.map({ $0.description }))
		
		for _ in 1...days {
			
			var newFish = 0
			for group in fishAgeGroups {
				group.age -= 1
				if group.age < 0 {
					group.age = 6
					newFish += group.count
				}
			}
			
			if newFish > 0 {
				if let newGroup = fishAgeGroups.first(where: { $0.age == 8 }) {
					newGroup.count += newFish
				} else {
					fishAgeGroups.append(FishGroup(age: 8, count: newFish))
				}
			}
			
//			print("\(i): \(fishAgeGroups.map({ $0.description }))")
			
//			var newFish = 0
//			fishAges = fishAges.map({ fish in
//				var newAge = fish
//				newAge -= 1
//				if newAge < 0 {
//					newAge = 6
//					newFish += 1
//				}
//				return newAge
//			})
//			fishAges.append(contentsOf: [Int](repeating: 8, count: newFish))
		}
		
		return "\(fishAgeGroups.reduce(0, { $0 + $1.count }))"
	}
	
	func parse(input: String) -> [Int] {
		return input
			.split(separator: ",")
			.map({
				Int($0)!
			})
	}
}
