import Foundation

public struct Day25: Challenge {
	
	public init() {}
	
	struct Coord: Equatable, Hashable {
		let row: Int
		let col: Int
	}
	
	enum Cucumber: Character {
		case empty = "."
		case east = ">"
		case south = "v"
	}
	
	class Board {
		var rows: [[Cucumber]]
		let numRows: Int
		let numCols: Int
		
		init(input: String) {
			rows = input
				.split(separator: "\n")
				.map({
					$0.map({
						Cucumber(rawValue: $0)!
					})
				})
			numRows = rows.count
			numCols = rows.first!.count
		}
		
		init(rows: Int, cols: Int) {
			numRows = rows
			numCols = cols
			self.rows = Array(repeating: Array(repeating: .empty, count: cols), count: rows)
		}
		
//		func getNeighbors(coord: Coord) -> [(Int, Coord)] {
//			let coords: [(Int, Int)] = [
//				(-1, -1), (+0, -1), (+1, -1),
//				(-1, +0),           (+1, +0),
//				(-1, +1), (+0, +1), (+1, +1),
//			]
//			return coords
//				.map({ Coord(row: $0.0 + coord.row, col: $0.1 + coord.col) })
//				.filter({ $0.row >= 0 && $0.row < numRows && $0.col >= 0 && $0.col < numCols })
//				.map({ (rows[$0.row][$0.col], $0) })
//		}
//
//		func getNeighborsandCenter(coord: Coord) -> [(Int, Coord)] {
//			let coords: [(Int, Int)] = [
//				(-1, -1), (-1, +0), (-1, +1),
//				(+0, -1), (+0, +0), (+0, +1),
//				(+1, -1), (+1, +0), (+1, +1),
//			]
//			return coords
//				.map({ Coord(row: $0.0 + coord.row, col: $0.1 + coord.col) })
////				.filter({ $0.row >= 0 && $0.row < numRows && $0.col >= 0 && $0.col < numCols })
//				.map({ coord in
//					let isIn = coord.row >= 0 && coord.row < numRows && coord.col >= 0 && coord.col < numCols
//					return (isIn ? rows[coord.row][coord.col] : 0, coord)
//				})
//		}
		
		func getEast(coord: Coord) -> Coord {
			let newCoord = Coord(row: coord.row, col: coord.col + 1)
			if newCoord.col >= numCols {
				return Coord(row: coord.row, col: 0)
			}
			return newCoord
		}
		
		func getSouth(coord: Coord) -> Coord {
			let newCoord = Coord(row: coord.row + 1, col: coord.col)
			if newCoord.row >= numRows {
				return Coord(row: 0, col: coord.col)
			}
			return newCoord
		}
		
		func printBoard() {
			for row in rows {
				print(String(row.map({ $0.rawValue })))
			}
			print()
		}
		
		func step() -> (Board, Bool) {
			var didMove = false
			var referenceBoard = self
			
			// East
			// Copy souths
			var newBoard = Board(rows: numRows, cols: numCols)
			for row in 0..<numRows {
				for col in 0..<numCols {
					if referenceBoard.rows[row][col] == .south {
						newBoard.rows[row][col] = .south
					}
				}
			}
			// Process easts
			for row in 0..<numRows {
				for col in 0..<numCols {
					let coord = Coord(row: row, col: col)
					switch referenceBoard.rows[row][col] {
					case .east:
						let eastCoord = getEast(coord: coord)
						if referenceBoard.rows[eastCoord.row][eastCoord.col] == .empty {
							newBoard.rows[eastCoord.row][eastCoord.col] = .east
							didMove = true
						} else {
							newBoard.rows[row][col] = .east
						}
					default:
						break
					}
				}
			}
			
			// South
			// Copy easts
			referenceBoard = newBoard
			newBoard = Board(rows: numRows, cols: numCols)
			for row in 0..<numRows {
				for col in 0..<numCols {
					if referenceBoard.rows[row][col] == .east {
						newBoard.rows[row][col] = .east
					}
				}
			}
			// Process souths
			for row in 0..<numRows {
				for col in 0..<numCols {
					let coord = Coord(row: row, col: col)
					switch referenceBoard.rows[row][col] {
					case .south:
						let southCoord = getSouth(coord: coord)
						if referenceBoard.rows[southCoord.row][southCoord.col] == .empty {
							newBoard.rows[southCoord.row][southCoord.col] = .south
							didMove = true
						} else {
							newBoard.rows[row][col] = .south
						}
					default:
						break
					}
				}
			}
			
			return (newBoard, didMove)
		}
	}
	
	public func solvePart1(input: String) -> String {
		var board = parse(input: input)
		
		var steps = 0
		var didMove = true
//		board.printBoard()
		while didMove {
			steps += 1
			print("Step \(steps)")
			(board, didMove) = board.step()
//			board.printBoard()
		}
//		board.printBoard()
		return "\(steps)"
	}
	
	public func solvePart2(input: String) -> String {
		let board = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> Board {
		return Board(input: input)
//		return input
//			.components(separatedBy: "\n")
//			.map({ Int($0)! })
	}
}
