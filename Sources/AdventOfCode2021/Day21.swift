import Foundation

public struct Day21: Challenge {
	
	public init() {}
	
	struct Coord: Equatable, Hashable {
		let row: Int
		let col: Int
	}
	
	class Board {
		var rows: [[Int]]
		let numRows: Int
		let numCols: Int
		
		init(input: String) {
			rows = input
				.split(separator: "\n")
				.map({
					$0.map({
						$0 == "." ? 0 : 1
					})
				})
			numRows = rows.count
			numCols = rows.first!.count
		}
		
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
		
		func getNeighborsandCenter(coord: Coord) -> [(Int, Coord)] {
			let coords: [(Int, Int)] = [
				(-1, -1), (-1, +0), (-1, +1),
				(+0, -1), (+0, +0), (+0, +1),
				(+1, -1), (+1, +0), (+1, +1),
			]
			return coords
				.map({ Coord(row: $0.0 + coord.row, col: $0.1 + coord.col) })
//				.filter({ $0.row >= 0 && $0.row < numRows && $0.col >= 0 && $0.col < numCols })
				.map({ coord in
					let isIn = coord.row >= 0 && coord.row < numRows && coord.col >= 0 && coord.col < numCols
					return (isIn ? rows[coord.row][coord.col] : 0, coord)
				})
		}
	}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> [Int] {
		return input
			.components(separatedBy: "\n")
			.map({ Int($0)! })
	}
}
