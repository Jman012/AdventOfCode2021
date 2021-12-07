import Foundation

public struct Day04: Challenge {
	
	public init() {}
	
	class Cell {
		let value: Int
		var drawn = false
		
		init(value: Int) {
			self.value = value
		}
	}
	
	class Board {
		let rows: [[Cell]]
		var isComplete = false
		
		init(input: String) {
			let rawRows = input.split(separator: "\n")
			var rows = [[Cell]]()
			for row in rawRows {
				let cols = row.split(separator: " ")
					.filter({ $0 != "" })
					.map({ Cell(value: Int($0)!) })
				rows.append(cols)
			}
			self.rows = rows
		}
		
		func mark(draw: Int) {
			for row in rows {
				for cell in row {
					if draw == cell.value {
						cell.drawn = true
					}
				}
			}
		}
		
		func isCompleteScore() -> Int {
			for row in rows {
				if row.allSatisfy({ $0.drawn }) {
					return rows
						.flatMap({ $0 })
						.filter({ $0.drawn == false })
						.reduce(0, { $0 + $1.value })
				}
			}
			
			for colIdx in 0..<rows.first!.count {
				let column = rows.map({ $0[colIdx] })
				if column.allSatisfy({ $0.drawn }) {
					return rows
						.flatMap({ $0 })
						.filter({ $0.drawn == false })
						.reduce(0, { $0 + $1.value })
				}
			}
			
			return 0
		}
	}
	
	public func solvePart1(input: String) -> String {
		let (draws, boards) = parse(input: input)
		for draw in draws {
//			print("Draw: \(draw)")
			for (index, board) in boards.enumerated() {
//				print("Board #\(index)")
				board.mark(draw: draw)
				
				let complete = board.isCompleteScore()
				if complete > 0 {
//					print("Board #\(index) on Draw \(draw) completed")
					return "\(complete * draw)"
				}
			}
		}
		return ""
	}
	
	public func solvePart2(input: String) -> String {
		var (draws, boards) = parse(input: input)
		for draw in draws {
//			print("Draw: \(draw)")
			for (index, board) in boards.enumerated() {
//				print("Board #\(index)")
				
				if !board.isComplete {
					board.mark(draw: draw)
					let complete = board.isCompleteScore()
					if complete > 0 {
//						print("Board #\(index) on Draw \(draw) completed")
						board.isComplete = true
	//					return "\(complete * draw)"
					}
				}
				
				if boards.filter({ !$0.isComplete }).count == 0 {
					// This was the last board to complete
					return "\(board.isCompleteScore() * draw)"
				}
			}
		}
		return ""
	}
	
	func parse(input: String) -> ([Int], [Board]) {
		let draws = input[input.startIndex..<input.firstIndex(of: "\n")!]
			.split(separator: ",")
			.map({ Int($0)! })
		
		let sBoards = input[input.firstIndex(of: "\n")!..<input.endIndex]
		let boards = sBoards
			.components(separatedBy: "\n\n")
			.filter({ $0 != "" })
			.map({ Board(input: $0) })
		
		return (draws, boards)
	}
}
