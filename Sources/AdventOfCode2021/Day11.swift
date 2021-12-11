import Foundation

public struct Day11: Challenge {
	
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
		
		func step() -> Int {
			var flashedCoords: Set<Coord> = []
			
			// Increase energy
			var allCoords: Set<Coord> = []
			for row in 0..<numRows {
				for col in 0..<numCols {
					let coord = Coord(row: row, col: col)
					rows[coord.row][coord.col] += 1
					allCoords.insert(coord)
				}
			}
			
			// Process flashes
			var coordsToProcess = allCoords
			while !coordsToProcess.isEmpty {
				var newCoords: Set<Coord> = []
				for coord in coordsToProcess {
					let (newFlashes, newCoordsToProcess) = process(coord: coord, flashedCoords: flashedCoords)
					flashedCoords.formUnion(newFlashes)
					newCoords.formUnion(newCoordsToProcess)
				}
				coordsToProcess = newCoords
			}
			
			for row in 0..<numRows {
				for col in 0..<numCols {
					if rows[row][col] > 9 {
						rows[row][col] = 0
					}
				}
			}
			
			return flashedCoords.count
		}
		
		func process(coord: Coord, flashedCoords: Set<Coord>) -> (Set<Coord>, Set<Coord>) {
			var newFlashes: Set<Coord> = []
			var newCoordsToProcess: Set<Coord> = []
			if rows[coord.row][coord.col] > 9 && !flashedCoords.contains(coord) {
				newFlashes.insert(coord)
				
				for neighbor in getNeighbors(coord: coord) {
					newCoordsToProcess.insert(neighbor.1)
					rows[neighbor.1.row][neighbor.1.col] += 1
				}
			}
			return (newFlashes, newCoordsToProcess)
		}
	}
	
	public func solvePart1(input: String) -> String {
		let board = parse(input: input)
//		print("Board:")
//		print(board.rows.map({ String(describing: $0) }).joined(separator: "\n"))
		var totalFlashes = 0
		for _ in 0..<100 {
//			print("Step \(i+1):")
			totalFlashes += board.step()
//			print(board.rows.map({ String(describing: $0) }).joined(separator: "\n"))
		}
		return "\(totalFlashes)"
	}
	
	public func solvePart2(input: String) -> String {
		let board = parse(input: input)
		var step = 1
		while board.step() != 100 {
			step += 1
		}
		return "\(step)"
	}
	
	func parse(input: String) -> Board {
		return Board(input: input)
			
	}
}
