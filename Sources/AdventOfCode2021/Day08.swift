import Foundation

public struct Day08: Challenge {
	
	public init() {}
	
	struct Entry {
		let wirings: [Set<Character>]
		let digits: [Set<Character>]
	}
	
	/*
	 0:      1:      2:      3:      4:
	aaaa    ....    aaaa    aaaa    ....
   b    c  .    c  .    c  .    c  b    c
   b    c  .    c  .    c  .    c  b    c
	....    ....    dddd    dddd    dddd
   e    f  .    f  e    .  .    f  .    f
   e    f  .    f  e    .  .    f  .    f
	gggg    ....    gggg    gggg    ....

	 5:      6:      7:      8:      9:
	aaaa    aaaa    aaaa    aaaa    aaaa
   b    .  b    .  .    c  b    c  b    c
   b    .  b    .  .    c  b    c  b    c
	dddd    dddd    ....    dddd    dddd
   .    f  e    f  .    f  e    f  .    f
   .    f  e    f  .    f  e    f  .    f
	gggg    gggg    ....    gggg    gggg

	 0: 6
	 1: 2
	 2: 5
	 3: 5
	 4: 4
	 5: 5
	 6: 6
	 7: 3
	 8: 7
	 9: 6
	 
	 6->0,6,9
	 2->1
	 5->2,3,5
	 4->4
	 3->7
	 7->8
	 
	 Known: 1,4,7,8
	 1+7: eliminate commons, find a
	 Known: 1,4,7,8,a
	 1+4: eliminate commons, find b, d
	 4+7: eliminate commons, find e, g
	 */
	
	public func solvePart1(input: String) -> String {
		let entries = parse(input: input)
		let num1478Digits = entries
			.map({ $0.digits })
		let num1478AllDigits = num1478Digits
			.flatMap({ $0 })
		let num1478Only1478 = num1478AllDigits
			.filter({ $0.count == 2 || $0.count == 4 || $0.count == 3 || $0.count == 7 })
		let num1478 = num1478Only1478
			.count
		
		return "\(num1478)"
	}
	
	public func solvePart2(input: String) -> String {
		let entries = parse(input: input)
		
		var acc = 0
		for entry in entries {
			let one = entry.wirings.first(where: { $0.count == 2 })!
			let four = entry.wirings.first(where: { $0.count == 4 })!
			let seven = entry.wirings.first(where: { $0.count == 3 })!
			let eight = entry.wirings.first(where: { $0.count == 7 })!
			let zerosixnine = entry.wirings.filter({ $0.count == 6 })
			let twothreefive = entry.wirings.filter({ $0.count == 5 })
			
			let a = seven.subtracting(one).first!
			let cf = one
//			let bd = one.intersection(four)
			let eg = eight.subtracting(seven).subtracting(four)
			
			let three = twothreefive.first(where: { $0.isSuperset(of: cf) })!
			let two = twothreefive.first(where: { $0.isSuperset(of: eg) })!
			let five = twothreefive.first(where: { $0 != three && $0 != two })!
			
			let zero = zerosixnine.first(where: { $0.subtracting([a]).subtracting(cf).subtracting(eg).count == 1 })!
			let sixnine = zerosixnine.filter({ $0 != zero })
			let six = sixnine.first(where: { $0.subtracting(cf).count == 5 })!
			let nine = sixnine.first(where: { $0 != six })!
			
			let digitLookup = [zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9]
			acc += Int("\(digitLookup[entry.digits[0]]!)\(digitLookup[entry.digits[1]]!)\(digitLookup[entry.digits[2]]!)\(digitLookup[entry.digits[3]]!)")!
		}
		return "\(acc)"
	}
	
	func parse(input: String) -> [Entry] {
		return input
			.split(separator: "\n")
			.map({
				let split = $0.components(separatedBy: " | ")
				let wirings = split[0].split(separator: " ").map({ Set($0) })
				let digits = split[1].split(separator: " ").map({ Set($0) })
				return Entry(wirings: wirings, digits: digits)
			})
	}
}
