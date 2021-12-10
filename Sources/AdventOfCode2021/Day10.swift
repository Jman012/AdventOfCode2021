import Foundation

extension Character {
	var isChunkOpener: Bool {
		switch self {
		case "(", "[", "{", "<":
			return true
		default:
			return false
		}
	}
	
	var getChunkCloser: Character {
		switch self {
		case "(":
			return ")"
		case "[":
			return "]"
		case "{":
			return "}"
		case "<":
			return ">"
		default:
			fatalError()
		}
	}
	
	var getChunkOpener: Character {
		switch self {
		case ")":
			return "("
		case "]":
			return "["
		case "}":
			return "{"
		case ">":
			return "<"
		default:
			fatalError()
		}
	}
	
	var getIllegalScore: Int {
		switch self {
		case ")":
			return 3
		case "]":
			return 57
		case "}":
			return 1197
		case ">":
			return 25137
		default:
			fatalError()
		}
	}
	
	var getAutocompleteScore: Int {
		switch self {
		case ")":
			return 1
		case "]":
			return 2
		case "}":
			return 3
		case ">":
			return 4
		default:
			fatalError()
		}
	}
}

public struct Day10: Challenge {
	
	public init() {}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		
		var acc = 0
		for line in lines {
			var stack: [Character] = []
			for character in line {
				if character.isChunkOpener {
					stack.append(character)
				} else if let last = stack.last, last == character.getChunkOpener {
					_ = stack.removeLast()
				} else {
					acc += character.getIllegalScore
					break
				}
			}
		}
		return "\(acc)"
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		
		var scores: [Int] = []
		for line in lines {
			var stack: [Character] = []
			var isCorrupt = false
			for character in line {
				if character.isChunkOpener {
					stack.append(character)
				} else if let last = stack.last, last == character.getChunkOpener {
					_ = stack.removeLast()
				} else {
					isCorrupt = true
					break
				}
			}
			
			if !isCorrupt {
				var score = 0
				for character in stack.reversed() {
					let closer = character.getChunkCloser
					score *= 5
					score += closer.getAutocompleteScore
				}
				scores.append(score)
			}
		}
		
		scores = scores.sorted()
		print(scores)
		let middleScore = scores[scores.count / 2]
		
		return "\(middleScore)"
	}
	
	func parse(input: String) -> [String] {
		return input
			.split(separator: "\n")
			.map({ String($0) })
			
	}
}
