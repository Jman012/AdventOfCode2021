import Foundation

public struct Day13: Challenge {
	
	public init() {}
	
	struct Coord: Equatable, Hashable {
		let row: Int
		let col: Int
	}
	
	class Board {
		var rows: [[Int]]
		let numRows: Int
		let numCols: Int
		
		init(rows: Int, cols: Int) {
			numRows = rows
			numCols = cols
			self.rows = Array(repeating: Array(repeating: 0, count: cols), count: rows)
		}
		
		func getNeighbors(coord: Coord) -> [(Int, Coord)] {
			let coords: [(Int, Int)] = [
				(-1, -1), (+0, -1), (+1, -1),
				(-1, +0),           (+1, +0),
				(-1, +1), (+0, +1), (+1, +1),
			]
			return coords
				.map({ Coord(row: $0.0 + coord.row, col: $0.1 + coord.col) })
				.filter({ $0.row >= 0 && $0.row < numRows && $0.col >= 0 && $0.col < numCols })
				.map({ (rows[$0.row][$0.col], $0) })
		}
		
		func getNeighborsWithoutDiagonal(coord: Coord) -> [(Int, Coord)] {
			let coords: [(Int, Int)] = [
						  (+0, -1),
				(-1, +0),           (+1, +0),
						  (+0, +1),
			]
			return coords
				.map({ Coord(row: $0.0 + coord.row, col: $0.1 + coord.col) })
				.filter({ $0.row >= 0 && $0.row < numRows && $0.col >= 0 && $0.col < numCols })
				.map({ (rows[$0.row][$0.col], $0) })
		}
		
		func fold(along: String, _ line: Int) -> Board {
			switch along {
			case "fold along x":
				let colsOfLeft = line
				let colsOfRight = numCols - line - 1
				let newBoard = Board(rows: numRows, cols: colsOfLeft)
				for row in 0..<numRows {
					for col in 0..<numCols {
						if self.rows[row][col] == 1 {
							if col < colsOfLeft {
								newBoard.rows[row][col] = 1
							} else {
								newBoard.rows[row][col - (col - colsOfLeft)*2] = 1
							}
						}
					}
				}
				return newBoard
			case "fold along y":
				let rowsOfUp = line
				let rowsOfDown = numRows - line - 1
				let newBoard = Board(rows: rowsOfUp, cols: numCols)
				for row in 0..<numRows {
					for col in 0..<numCols {
						if self.rows[row][col] == 1 {
							if row < rowsOfUp {
								newBoard.rows[row][col] = 1
							} else {
								newBoard.rows[row - (row - rowsOfUp)*2][col] = 1
							}
						}
					}
				}
				return newBoard
			default:
				fatalError()
			}
		}
		
		func printboard() {
			for row in rows {
				print(String(row.map({ $0 == 0 ? "." : "#" })))
			}
			print()
		}
	}
	
	public func solvePart1(input: String) -> String {
		let data = parse(input: input)
//		data.0.printboard()
		let newBoard = data.0.fold(along: data.1.first!.0, data.1.first!.1)
//		newBoard.printboard()
		let count = newBoard.rows.flatMap({ $0 }).filter({ $0 == 1 }).count
		return "\(count)"
	}
	
	public func solvePart2(input: String) -> String {
		let data = parse(input: input)
		var newBoard = data.0
		for fold in data.1 {
			newBoard = newBoard.fold(along: fold.0, fold.1)
		}
//		newBoard.printboard()
		let count = newBoard.rows.flatMap({ $0 }).filter({ $0 == 1 }).count
		return "\(count)"
	}
	
	func parse(input: String) -> (Board, [(String, Int)]) {
		let split = input.components(separatedBy: "\n\n")
		let coords: [Coord] = split[0]
			.split(separator: "\n")
			.map({ line in
				let split2 = line.split(separator: ",")
				return Coord(row: Int(split2[1])!, col: Int(split2[0])!)
			})
		let board = Board(rows: coords.map({ $0.row }).max()! + 1, cols: coords.map({ $0.col }).max()! + 1)
		for coord in coords {
			board.rows[coord.row][coord.col] = 1
		}
		
		let folds = split[1]
			.split(separator: "\n")
			.map({ line -> (String, Int) in
				let split2 = line.split(separator: "=")
				return (String(split2[0]), Int(split2[1])!)
			})
		
		return (board, folds)
	}
}
