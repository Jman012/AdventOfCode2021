import Foundation

public struct Day03: Challenge {
	
	public init() {}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		let lineCount = lines.count
		var occurrences = Array<Int>(repeating: 0, count: lines.first!.count)
		
		for line in lines {
			for (bitIndex, bitValue) in line.enumerated() {
				if bitValue == "1" {
					occurrences[bitIndex] += 1
				}
			}
		}
		
		var gamma = ""
		for bitOccurrence in occurrences {
			gamma += bitOccurrence > (lineCount / 2) ? "1" : "0"
		}
		let gammaNumber = Int(gamma, radix: 2)!
		
		var epsilon = ""
		for bitOccurrence in occurrences {
			epsilon += bitOccurrence > (lineCount / 2) ? "0" : "1"
		}
		let epsilonNumber = Int(epsilon, radix: 2)!
		
//		print(gamma, gammaNumber, epsilon, epsilonNumber)
		
		return "\(gammaNumber * epsilonNumber)"
	}
	
	public func solvePart2(input: String) -> String {
		var lines = parse(input: input)
		let bitCount = lines.first!.count
		
		for bitNumber in 0..<bitCount {
			var bitOccurrence = 0
			for line in lines {
				if line[line.index(line.startIndex, offsetBy: bitNumber)] == "1" {
					bitOccurrence += 1
				}
			}
			if Float(bitOccurrence) >= (Float(lines.count) / 2.0) {
				lines = lines.filter {
					$0[$0.index($0.startIndex, offsetBy: bitNumber)] == "1"
				}
//				print("More 1s, keep 1s")
//				print(lines)
			} else {
				lines = lines.filter {
					$0[$0.index($0.startIndex, offsetBy: bitNumber)] == "0"
				}
//				print("More 0s, keep 0s")
//				print(lines)
			}
			
			if lines.count == 1 {
				break
			}
		}
		
		let oxygen = Int(lines.first!, radix: 2)!
//		print(lines, oxygen)
		
		lines = parse(input: input)
		for bitNumber in 0..<bitCount {
			var bitOccurrence = 0
			for line in lines {
				if line[line.index(line.startIndex, offsetBy: bitNumber)] == "1" {
					bitOccurrence += 1
				}
			}
			if Float(bitOccurrence) >= (Float(lines.count) / 2.0) {
				lines = lines.filter {
					$0[$0.index($0.startIndex, offsetBy: bitNumber)] == "0"
				}
//				print("More 1s, keep 0s")
//				print(lines)
			} else {
				lines = lines.filter {
					$0[$0.index($0.startIndex, offsetBy: bitNumber)] == "1"
				}
//				print("More 0s, keep 1s")
//				print(lines)
			}
			
			if lines.count == 1 {
				break
			}
		}
		
		let co2 = Int(lines.first!, radix: 2)!
//		print(lines, co2)
		
//		print(oxygen, co2)
		return "\(oxygen * co2)"
	}
	
	func parse(input: String) -> [String] {
		return input
			.split(separator: "\n")
			.map({ String($0) })
	}
}
