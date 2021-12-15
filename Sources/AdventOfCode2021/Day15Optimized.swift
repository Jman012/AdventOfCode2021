import Foundation
import Collections

public struct Day15Optimized: Challenge {
	
	public init() {}
	
	struct Coord: Equatable, Hashable {
		let row: Int
		let col: Int
	}
	
	struct Item {
		var value: Int
		var weight: Int
		var visited: Bool
	}
	
	class Board {
		var rows: [[Item]]
		let numRows: Int
		let numCols: Int
		
		init(input: String) {
			rows = input
				.split(separator: "\n")
				.map({ (blah) -> [Item] in
					return blah.map({ (num) -> Item in
						return Item(value: Int(String(num))!, weight: Int.max, visited: false)
					})
				})
			numRows = rows.count
			numCols = rows.first!.count
		}
		
		init(rows: Int, cols: Int) {
			numRows = rows
			numCols = cols
			self.rows = Array(repeating: Array(repeating: Item(value: 0, weight: Int.max, visited: false), count: cols), count: rows)
		}
		
		func getNeighborsWithoutDiagonal(coord: Coord) -> [Coord] {
			let coords: [(Int, Int)] = [
						  (+0, -1),
				(-1, +0),           (+1, +0),
						  (+0, +1),
			]
			return coords
				.lazy
				.map({ Coord(row: $0.0 + coord.row, col: $0.1 + coord.col) })
				.filter({ $0.row >= 0 && $0.row < numRows && $0.col >= 0 && $0.col < numCols })
		}
		
		func fillResistances() {
			var current = Coord(row: numRows-1, col: numCols-1)
			rows[current.row][current.col].weight = 0
			var nextNodes: Set<Coord> = []
			
			while true {
				let currentItem = rows[current.row][current.col]
				for neighbor in getNeighborsWithoutDiagonal(coord: current) {
					if !rows[neighbor.row][neighbor.col].visited {
						var neighborItem = rows[neighbor.row][neighbor.col]
						neighborItem.weight = min(neighborItem.weight, currentItem.value + currentItem.weight)
						rows[neighbor.row][neighbor.col] = neighborItem
						nextNodes.insert(neighbor)
					}
				}
				rows[current.row][current.col].visited = true
				nextNodes.remove(current)
				if let newCurrent = nextNodes.min(by: { rows[$0.row][$0.col].weight < rows[$1.row][$1.col].weight }) {
					current = newCurrent
				} else {
					break
				}
			}
		}
	}
	
	public func solvePart1(input: String) -> String {
		let board = parse(input: input)
		board.fillResistances()
//		for row in board.rows {
//			print(String(row.map({ "(\($0.value), \(String(format: "%3d", $0.weight)))"}).joined(separator: ", ")))
//		}
		let pathCost = board.rows[0][0].weight
		return "\(pathCost)"
	}
	
	public func solvePart2(input: String) -> String {
		let originalBoard = parse(input: input)
		let board = Board(rows: originalBoard.numRows*5, cols: originalBoard.numCols*5)
		for y in 0..<5 {
			for x in 0..<5 {
				for row in 0..<originalBoard.numRows {
					for col in 0..<originalBoard.numCols {
						let newValue = ((originalBoard.rows[row][col].value + y + x - 1) % 9) + 1
						board.rows[(y * originalBoard.numRows) + row][(x * originalBoard.numCols) + col].value = newValue
					}
				}
			}
		}
		
		board.fillResistances()
		let pathCost = board.rows[0][0].weight
		return "\(pathCost)"
	}
	
	func parse(input: String) -> Board {
		return Board(input: input)
	}
}
