import Foundation

public struct Day05: Challenge {
	
	public init() {}
	
	struct Vector {
		let x: Int
		let y: Int
	}
	
	struct Line {
		let vectorBegin: Vector
		let vectorEnd: Vector
		
		func getLinePoints(diagonal: Bool = false) -> [Vector] {
			if vectorBegin.x == vectorEnd.x {
				// Vertical Line
				if vectorBegin.y < vectorEnd.y {
					return (vectorBegin.y...vectorEnd.y).map({ Vector(x: vectorBegin.x, y: $0) })
				} else {
					return (vectorEnd.y...vectorBegin.y).map({ Vector(x: vectorBegin.x, y: $0) })
				}
			} else if vectorBegin.y == vectorEnd.y {
				// Horizontal Line
				if vectorBegin.x < vectorEnd.x {
					return (vectorBegin.x...vectorEnd.x).map({ Vector(x: $0, y: vectorBegin.y) })
				} else {
					return (vectorEnd.x...vectorBegin.x).map({ Vector(x: $0, y: vectorBegin.y) })
				}
			} else if diagonal && abs(vectorBegin.x - vectorEnd.x) == abs(vectorBegin.y - vectorEnd.y) {
				if vectorBegin.x < vectorEnd.x && vectorBegin.y < vectorEnd.y {
					return (0...(vectorEnd.x - vectorBegin.x)).map({ Vector(x: vectorBegin.x + $0, y: vectorBegin.y + $0) })
				} else if vectorBegin.x < vectorEnd.x && vectorBegin.y > vectorEnd.y {
					return (0...(vectorEnd.x - vectorBegin.x)).map({ Vector(x: vectorBegin.x + $0, y: vectorBegin.y - $0) })
				} else if vectorBegin.x > vectorEnd.x && vectorBegin.y < vectorEnd.y {
					return (0...(vectorBegin.x - vectorEnd.x)).map({ Vector(x: vectorEnd.x + $0, y: vectorEnd.y - $0) })
				} else if vectorBegin.x > vectorEnd.x && vectorBegin.y > vectorEnd.y {
					return (0...(vectorBegin.x - vectorEnd.x)).map({ Vector(x: vectorEnd.x + $0, y: vectorEnd.y + $0) })
				} else {
					fatalError()
				}
			} else {
				return []
			}
		}
	}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		let maxCols = max(lines.map({ $0.vectorBegin.x }).max()!, lines.map({ $0.vectorEnd.x }).max()!)
		let maxRows = max(lines.map({ $0.vectorBegin.y }).max()!, lines.map({ $0.vectorEnd.y }).max()!)
		var board = [[Int]](repeating: [Int](repeating: 0, count: maxCols+1), count: maxRows+1)
		
		var overTwos = 0
		for line in lines {
			for vector in line.getLinePoints() {
				board[vector.y][vector.x] += 1
				if board[vector.y][vector.x] == 2 {
					overTwos += 1
				}
			}
		}
		
//		for row in board {
//			for col in row {
//				print("\(col == 0 ? "." : "\(col)")", terminator: "")
//			}
//			print()
//		}
		
		return "\(overTwos)"
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		let maxCols = max(lines.map({ $0.vectorBegin.x }).max()!, lines.map({ $0.vectorEnd.x }).max()!)
		let maxRows = max(lines.map({ $0.vectorBegin.y }).max()!, lines.map({ $0.vectorEnd.y }).max()!)
		var board = [[Int]](repeating: [Int](repeating: 0, count: maxCols+1), count: maxRows+1)
		
		var overTwos = 0
		for line in lines {
			for vector in line.getLinePoints(diagonal: true) {
				board[vector.y][vector.x] += 1
				if board[vector.y][vector.x] == 2 {
					overTwos += 1
				}
			}
		}
		
//		for row in board {
//			for col in row {
//				print("\(col == 0 ? "." : "\(col)")", terminator: "")
//			}
//			print()
//		}
		
		return "\(overTwos)"
	}
	
	func parse(input: String) -> [Line] {
		return input
			.split(separator: "\n")
			.map({
				let split1 = $0.components(separatedBy: " -> ")
				let split2 = split1[0].split(separator: ",")
				let split3 = split1[1].split(separator: ",")
				return Line(vectorBegin: Vector(x: Int(split2[0])!, y: Int(split2[1])!), vectorEnd: Vector(x: Int(split3[0])!, y: Int(split3[1])!))
			})
	}
}
