import Foundation

public struct Day14: Challenge {
	
	public init() {}
	
	func iterate(template: String, insertions: [String: String]) -> String {
		var newString: [Character] = []
		for index in 0..<template.count-1 {
			let lookup: String = String(template[template.index(template.startIndex, offsetBy: index)...template.index(template.startIndex, offsetBy: index+1)])
			
			if index == 0 {
				newString.append(template[template.index(template.startIndex, offsetBy: index)])
			}
			if let result = insertions[lookup] {
				newString.append(result.first!)
			} else {
				print("ding")
			}
			newString.append(template[template.index(template.startIndex, offsetBy: index+1)])
		}
		return String(newString)
	}
	
	public func solvePart1(input: String) -> String {
		let (template, insertions) = parse(input: input)
		
		var newString = template
		for _ in 0..<10 {
			newString = iterate(template: newString, insertions: insertions)
		}
		
		var counts: [Character: Int] = [:]
		for character in newString {
			if let count = counts[character] {
				counts[character] = count + 1
			} else {
				counts[character] = 1
			}
		}
		
		let min = counts.values.min()!
		let max = counts.values.max()!
		
		return "\(max - min)"
	}
	
	public func solvePart2(input: String) -> String {
		let (template, insertions) = parse(input: input)
		
		var counts: [String: Int] = [:]
		for insertion in insertions.keys {
			counts[insertion] = 0
		}
		
		for index in 0..<template.count-1 {
			let lookup: String = String(template[template.index(template.startIndex, offsetBy: index)...template.index(template.startIndex, offsetBy: index+1)])
			
			counts[lookup]! += 1
		}
		
//		print(counts)
		for _ in 0..<40 {
			var newCounts = counts
			for count in counts {
				if count.value == 0 {
					continue
				}
				if let result = insertions[count.key] {
					newCounts[count.key]! -= count.value
					newCounts[String([count.key.first!, result.first!])]! += count.value
					newCounts[String([result.first!, count.key.last!])]! += count.value
				} else {
					print("ding")
				}
			}
			counts = newCounts
//			print(counts)
		}
		
		var numCounts: [Character: Int] = [:]
		for count in counts {
			for character in count.key {
				if let numCount = numCounts[character] {
					numCounts[character] = numCount + count.value
				} else {
					numCounts[character] = count.value
				}
			}
		}
//		print(numCounts)

		let min = numCounts.values.min()!
		let max = numCounts.values.max()!
		
		return "\(Int(ceil(Double(max - min)/2.0)))"
	}
	
	func parse(input: String) -> (String, [String: String]) {
		let split = input.components(separatedBy: "\n\n")
		let template = split[0]
		let insertions: [(String, String)] = split[1]
			.split(separator: "\n")
			.map({ line -> (String, String) in
				let split2 = line.components(separatedBy: " -> ")
				return (String(split2[0]), String(split2[1]))
			})
		let dictInsertions: [String: String] = Dictionary(uniqueKeysWithValues: insertions)
		return (template, dictInsertions)
	}
}
