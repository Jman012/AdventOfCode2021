import Foundation

public struct Day09: Challenge {
	
	public init() {}
	
	struct Coord: Equatable, Hashable {
		let row: Int
		let col: Int
	}
	
	struct Board {
		let rows: [[Int]]
		let numRows: Int
		let numCols: Int
		
		init(input: String) {
			rows = input
				.split(separator: "\n")
				.map({
					$0.map({
						Int(String($0))!
					})
				})
			numRows = rows.count
			numCols = rows.first!.count
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
		
		func getBasin(coord: Coord, currentBasin: Set<Coord>) -> Set<Coord> {
			if rows[coord.row][coord.col] == 9 {
				return []
			}
			let neighbors = getNeighborsWithoutDiagonal(coord: coord)
			let goodNeighbors = neighbors
				.filter({ $0.0 != 9 && !currentBasin.contains($0.1) })
			var newBasin = currentBasin
			newBasin.insert(coord)
			for goodNeighbor in goodNeighbors {
				newBasin.formUnion(getBasin(coord: goodNeighbor.1, currentBasin: newBasin))
			}
			return newBasin
		}
	}
	
	public func solvePart1(input: String) -> String {
		let board = parse(input: input)
		var acc = 0
		for row in 0..<board.numRows {
			for col in 0..<board.numCols {
				let coord = Coord(row: row, col: col)
				let neighbors = board.getNeighbors(coord: coord)
				if neighbors.allSatisfy({ $0.0 > board.rows[row][col] }) {
					acc += board.rows[row][col] + 1
				}
			}
		}
		return "\(acc)"
	}
	
	public func solvePart2(input: String) -> String {
		let board = parse(input: input)
		
		var basins: [Set<Coord>] = []
		for row in 0..<board.numRows {
			for col in 0..<board.numCols {
				let coord = Coord(row: row, col: col)
				if basins.first(where: { $0.contains(coord) }) != nil {
					continue
				}
				
				let basin = board.getBasin(coord: coord, currentBasin: [])
				if !basin.isEmpty {
					basins.append(basin)
				}
			}
		}
		return "\(basins.sorted(by: { $0.count > $1.count })[0..<3].reduce(1, { $0 * $1.count }))"
	}
	
	func parse(input: String) -> Board {
		return Board(input: input)
	}
}
