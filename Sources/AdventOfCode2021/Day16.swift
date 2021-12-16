import Foundation

public struct Day16: Challenge {
	
	public init() {}
	
	func parseBinary(input: [Character]) -> (Int, Int, Int) {
//		print("parsing: \(input)")
		let version = Int(String(input[0..<3]), radix: 2)!
		let typeId = Int(String(input[3..<6]), radix: 2)!
		
//		print("version: \(version)")
//		print("typeId: \(typeId)")
		
		switch typeId {
		case 4:
			var index = 6
			var strNum = ""
			while true {
				let next = index + 5
				let chunk = input[index..<next]
				strNum += String(chunk.dropFirst())
				index = next
				if chunk.first! == "0" {
					break
				}
			}
			let num = Int(strNum, radix: 2)!
//			print("literal: \(num)")
			print("Literal(\(version), \(typeId), \(num))")
			return (index, version, num)
		default:
			// Operator
			let lengthTypeId = input[input.index(input.startIndex, offsetBy: 6)]
			var nextIndex: Int
			var versionAcc = 0
			var nums: [Int] = []
			print("Operator(\(version), \(typeId), List(")
			if lengthTypeId == "0" {
//				print("lengthTypeId: 0")
				let length = Int(String(input[7..<22]), radix: 2)!
//				print("length: \(length)")
				nextIndex = 22
				while true {
//					print("sub packet: input[\(nextIndex)..<\(input.endIndex)]")
					let result = parseBinary(input: input[nextIndex..<input.endIndex].map({ $0 }))
					nextIndex += result.0
					versionAcc += result.1
					nums.append(result.2)
					if nextIndex-22 >= length {
						break
					}
					print(", ")
				}
			} else {
//				print("lengthTypeId: 1")
				let numSubPackets = Int(String(input[7..<18]), radix: 2)!
//				print("numSubPackets: \(numSubPackets)")
				nextIndex = 18
				for i in 0..<numSubPackets {
//					print("sub packet #\(i): input[\(nextIndex)..<\(input.endIndex)]")
					let result = parseBinary(input: input[nextIndex..<input.endIndex].map({ $0 }))
					nextIndex += result.0
					versionAcc += result.1
					nums.append(result.2)
					if i < numSubPackets-1 { print(", ") }
				}
			}
			print("))")
			
			switch typeId {
			case 0:
				return (nextIndex, version + versionAcc, nums.reduce(0, +))
			case 1:
				return (nextIndex, version + versionAcc, nums.reduce(1, *))
			case 2:
				return (nextIndex, version + versionAcc, nums.min()!)
			case 3:
				return (nextIndex, version + versionAcc, nums.max()!)
			case 5:
				return (nextIndex, version + versionAcc, nums.first! > nums.last! ? 1 : 0)
			case 6:
				return (nextIndex, version + versionAcc, nums.first! < nums.last! ? 1 : 0)
			case 7:
				return (nextIndex, version + versionAcc, nums.first! == nums.last! ? 1 : 0)
			default:
				fatalError()
			}
		}
	}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		print(lines)
		let result = parseBinary(input: lines.map({ $0 }))
		return "\(result.1)"
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		print(lines)
		let result = parseBinary(input: lines.map({ $0 }))
		return "\(result.2)"
	}
	
	func parse(input: String) -> String {
		return String(input
			.map({ Int(String($0), radix: 16)! })
			.map({ (a) -> String in
				var b = String(a, radix: 2)
				if b.count < 4 {
					b = String(repeating: "0", count: 4 - b.count) + b
				}
				return b
			})
			.flatMap({ $0 }))
	}
}
