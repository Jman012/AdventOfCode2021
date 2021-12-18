import Foundation

protocol Snail {
	var description: String { get }
	var leftMostNum: SnailNumber { get }
	var rightMostNum: SnailNumber { get }
	var magnitude: Int { get }
	func copy() -> Snail
}

class SnailNumber: Snail {
	var num: Int
	public var description: String { "\(num)" }
	init(num: Int) {
		self.num = num
	}
	var leftMostNum: SnailNumber { self }
	var rightMostNum: SnailNumber { self }
	var magnitude: Int { self.num }
	func copy() -> Snail {
		return SnailNumber(num: self.num)
	}
}

class SnailPair: Snail {
	var left: Snail
	var right: Snail
	public var description: String { "[\(left.description),\(right.description)]" }
	init(left: Snail, right: Snail) {
		self.left = left
		self.right = right
	}
	var leftMostNum: SnailNumber { left.leftMostNum }
	var rightMostNum: SnailNumber { right.rightMostNum }
	var magnitude: Int { 3*left.magnitude + 2*right.magnitude }
	func copy() -> Snail {
		return SnailPair(left: self.left.copy(), right: self.right.copy())
	}
}

public struct Day18: Challenge {
	
	public init() {}
	
	func addSnails(left: Snail, right: Snail) -> SnailPair {
		return SnailPair(left: left, right: right)
	}
	
	func reduceExplode(snailPair: SnailPair,
					   rightOfLeftMost: SnailNumber = SnailNumber(num: Int.min),
					   leftOfRightMost: SnailNumber = SnailNumber(num: Int.min),
				depth: Int = 0) -> Snail? {
		if let leftNum = snailPair.left as? SnailNumber, let rightNum = snailPair.right as? SnailNumber, depth >= 4 {
			// Explode
			let oldLeft = rightOfLeftMost.num
			let oldRight = leftOfRightMost.num
			rightOfLeftMost.num += leftNum.num
			leftOfRightMost.num += rightNum.num
//			print("Exploded \(snailPair.description). The number on the left: \(oldLeft)+\(leftNum.num)->\(rightOfLeftMost.num). The number on the right: \(oldRight)+\(rightNum.num)->\(leftOfRightMost.num).")
			return SnailNumber(num: 0)
		} else {
			if let leftPair = snailPair.left as? SnailPair {
				if let newSnail = reduceExplode(snailPair: leftPair, rightOfLeftMost: rightOfLeftMost, leftOfRightMost: snailPair.right.leftMostNum, depth: depth + 1) {
					snailPair.left = newSnail
					return snailPair
				}
			}
			if let rightPair = snailPair.right as? SnailPair {
				if let newSnail = reduceExplode(snailPair: rightPair, rightOfLeftMost: snailPair.left.rightMostNum, leftOfRightMost: leftOfRightMost, depth: depth + 1) {
					snailPair.right = newSnail
					return snailPair
				}
			}
		}
		return nil
	}
	
	func reduceSplit(snailPair: SnailPair,
				rightOfLeftMost: SnailNumber = SnailNumber(num: 0),
				leftOfRightMost: SnailNumber = SnailNumber(num: 0),
				depth: Int = 0) -> Snail? {
		if let leftNum = snailPair.left as? SnailNumber, leftNum.num > 9 {
			// Split left
//			print("Split \(snailPair.left.description) to \(SnailPair(left: SnailNumber(num: Int(floor(Double(leftNum.num) / 2.0))), right: SnailNumber(num: Int(ceil(Double(leftNum.num) / 2.0)))).description)")
			snailPair.left = SnailPair(left: SnailNumber(num: Int(floor(Double(leftNum.num) / 2.0))), right: SnailNumber(num: Int(ceil(Double(leftNum.num) / 2.0))))
			return snailPair
		}
		if let leftPair = snailPair.left as? SnailPair {
			if let newSnail = reduceSplit(snailPair: leftPair, rightOfLeftMost: rightOfLeftMost, leftOfRightMost: snailPair.right.leftMostNum, depth: depth + 1) {
				snailPair.left = newSnail
				return snailPair
			}
		}
		if let rightNum = snailPair.right as? SnailNumber, rightNum.num > 9 {
			// Split right
//			print("Split \(snailPair.right.description) to \(SnailPair(left: SnailNumber(num: Int(floor(Double(rightNum.num) / 2.0))), right: SnailNumber(num: Int(ceil(Double(rightNum.num) / 2.0)))).description)")
			snailPair.right = SnailPair(left: SnailNumber(num: Int(floor(Double(rightNum.num) / 2.0))), right: SnailNumber(num: Int(ceil(Double(rightNum.num) / 2.0))))
			return snailPair
		}
		if let rightPair = snailPair.right as? SnailPair {
			if let newSnail = reduceSplit(snailPair: rightPair, rightOfLeftMost: snailPair.left.rightMostNum, leftOfRightMost: leftOfRightMost, depth: depth + 1) {
				snailPair.right = newSnail
				return snailPair
			}
		}
		return nil
	}
	
	func fullyReduce(snail: SnailPair) {
//		print(snail.description)
		while true {
			if reduceExplode(snailPair: snail) == nil {
				if reduceSplit(snailPair: snail) == nil {
					break
				}
			}
//			print(snail.description)
		}
//		print(snail.description)
	}
	
	func magnitude(snail: Snail) -> Int {
		return snail.magnitude
	}
	
	public func solvePart1(input: String) -> String {
		// Explode tests
//		let lines = parse(input: #"""
//[[[[[9,8],1],2],3],4]
//[7,[6,[5,[4,[3,2]]]]]
//[[6,[5,[4,[3,2]]]],1]
//[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]
//[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]
//"""#)
//		for line in lines {
//			print("Before: \(line.description)")
//			_ = reduceExplode(snailPair: line)
//			print(" After: \(line.description)")
//		}
//		return ""
		
		// Explode + Split test
//		var snail = parse(input: "[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]").first!
//		print("Start: \(snail.description)")
//		for _ in 0..<6 {
//			if reduceExplode(snailPair: snail) == nil {
//				if reduceSplit(snailPair: snail) == nil {
//					break
//				}
//			}
//			print("Next: \(snail.description)")
//		}
//		return ""
		
		// Magnitude test
//		var snail = parse(input: "[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]").first!
//		print(magnitude(snail: snail))
//		return ""
		
		let lines = parse(input: input)
		var snail = lines.first!
		for line in lines.dropFirst() {
//			print("  \(snail.description)")
//			print("+ \(line.description)")
			snail = addSnails(left: snail, right: line)
			fullyReduce(snail: snail)
//			print("= \(snail.description)")
			print()
		}
		print(snail.description)
		let magnitude = magnitude(snail: snail)
		return "\(magnitude)"
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		var largestMagnitude = 0
		
		for i in 0..<lines.count {
			for j in 0..<lines.count {
				if i == j {
					continue
				}
				let left = lines[i].copy()
				let right = lines[j].copy()
				let snail1 = addSnails(left: left, right: right)
				fullyReduce(snail: snail1)
//				print("Attempt \(magnitude(snail: snail1)): \(left.description) + \(right.description)")
				if magnitude(snail: snail1) > largestMagnitude {
					largestMagnitude = magnitude(snail: snail1)
				}
				
				let left2 = lines[i].copy()
				let right2 = lines[j].copy()
				let snail2 = addSnails(left: right2, right: left2)
				fullyReduce(snail: snail2)
//				print("Attempt \(magnitude(snail: snail2)): \(left.description) + \(right.description)")
				if magnitude(snail: snail2) > largestMagnitude {
					largestMagnitude = magnitude(snail: snail2)
				}
			}
		}
		
		return "\(largestMagnitude)"
	}
	
	func parse(input: String) -> [SnailPair] {
		return input
			.split(separator: "\n")
			.map({ SnailParser(s: $0).read() as! SnailPair })
	}
	
	class SnailParser {
		var snailString: Substring
		init(s: Substring) {
			snailString = s
		}
		func read() -> Snail {
			if snailString.first == "[" {
				snailString = snailString.dropFirst() // [
				let first = read()
				snailString = snailString.dropFirst() // ,
				let last = read()
				snailString = snailString.dropFirst() // ]
				return SnailPair(left: first, right: last)
			} else {
				let num = snailString.first!
				snailString = snailString.dropFirst() // \d
				return SnailNumber(num: Int(String(num))!)
			}
		}
	}
}
