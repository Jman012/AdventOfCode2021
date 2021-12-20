import Foundation

public struct Day20: Challenge {
	
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
		
		func getIndex(coord: Coord) -> Int {
			return Int(getNeighborsandCenter(coord: coord).map({ String($0.0) }).joined(), radix: 2)!
		}
		
		func printBoard() {
			for row in rows {
				print(String(row.map({ $0 == 0 ? "." : "#" })))
			}
			print()
		}
		
		let increase = 10
		
		func enhance(algo: String, newBoard: Board) {
			for row in -increase..<numRows+increase {
				for col in -increase..<numCols+increase {
					enhancePixel(coord: Coord(row: row, col: col), algo: algo, newBoard: newBoard)
				}
			}
		}
		
		func enhancePixel(coord: Coord, algo: String, newBoard: Board) {
			let index = getIndex(coord: coord)
			let pixel = algo[algo.index(algo.startIndex, offsetBy: index)] == "#" ? 1 : 0
			newBoard.rows[coord.row+increase][coord.col+increase] = pixel
		}
		
		func crop() -> Board {
			
			
//			let bg = rows[0][0]
//
//			var topBgRows = 0
//			var curRow = 0
//			while rows[curRow].allSatisfy({ $0 == bg }) {
//				topBgRows += 1
//				curRow += 1
//			}
//
//			var bottomBgRows = 0
//			curRow = numRows - 1
//			while rows[curRow].allSatisfy({ $0 == bg }) {
//				bottomBgRows += 1
//				curRow -= 1
//			}
//
//			var leftBgCols = 0
//			var curCol = 0
//			while rows.map({ $0[curCol] }).allSatisfy({ $0 == bg }) {
//				leftBgCols += 1
//				curCol += 1
//			}
//
//			var rightBgCols = 0
//			curCol = numCols - 1
//			while rows.map({ $0[curCol] }).allSatisfy({ $0 == bg }) {
//				rightBgCols += 1
//				curCol -= 1
//			}
//
			
			let shave = (increase - 1) * 2
			let topBgRows = shave
			let bottomBgRows = shave
			let leftBgCols = shave
			let rightBgCols = shave
			
			let newBoard = Board(rows: numRows - topBgRows - bottomBgRows, cols: numCols - leftBgCols - rightBgCols)
			for row in topBgRows..<numRows-(bottomBgRows) {
				for col in leftBgCols..<numCols-(rightBgCols) {
					newBoard.rows[row-(topBgRows)][col-(leftBgCols)] = rows[row][col]
				}
			}
			return newBoard
//			return self
		}
	}
	
	func solve(input: String, iterations: Int) -> String {
		var (algo, board) = parse(input: input)
		
//		board.printBoard()
		var newBoard = Board(rows: board.numRows + board.increase*2, cols: board.numCols + board.increase*2)
		for i in 0..<iterations {
			board.enhance(algo: algo, newBoard: newBoard)
//			newBoard.printBoard()
			
			if i % 2 == 1 {
				board = newBoard.crop()
			} else {
				board = newBoard
			}
//			board = newBoard//.crop()
//			board.printBoard()
			newBoard = Board(rows: board.numRows + board.increase*2, cols: board.numCols + board.increase*2)
		}
//		board.printBoard()
		return "\(board.rows.flatMap({ $0 }).filter({ $0 == 1 }).count)"
	}
	
	public func solvePart1(input: String) -> String {
		return solve(input: input, iterations: 2)
	}
	
	public func solvePart2(input: String) -> String {
		return solve(input: input, iterations: 50)
	}
	
	func parse(input: String) -> (String, Board) {
//		return input
//			.components(separatedBy: "\n")
//			.map({ Int($0)! })
		let split = input.components(separatedBy: "\n\n")
		
		return (split[0], Board(input: split[1]))
	}
}
