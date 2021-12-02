import Foundation

struct Day02: Challenge {
	
	enum Instruction: String {
		case forward
		case down
		case up
	}
	
	func solvePart1(input: String) -> String {
		let instrs = parseInstructions(input: input)
		var x = 0, depth = 0
		for instr in instrs {
			switch instr.0 {
			case .forward:
				x += instr.1
			case .up:
				depth -= instr.1
			case .down:
				depth += instr.1
			}
		}
		return "\(x * depth)"
	}
	
	func solvePart2(input: String) -> String {
		let instrs = parseInstructions(input: input)
		var aim = 0, depth = 0, horizontal = 0
		for instr in instrs {
			switch instr.0 {
			case .forward:
				horizontal += instr.1
				depth += aim * instr.1
			case .up:
				aim -= instr.1
			case .down:
				aim += instr.1
			}
		}
		return "\(horizontal * depth)"
	}
	
	func parseInstructions(input: String) -> [(Instruction, Int)] {
		return input
			.split(separator: "\n")
			.map({ instr in
				let split = instr.split(separator: " ")
				let instruction = Instruction(rawValue: String(split[0]))!
				let num = Int(String(split[1]))!
				return (instruction, num)
			})
	}
}
