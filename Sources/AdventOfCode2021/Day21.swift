import Foundation

public struct Day21: Challenge {
	
	public init() {}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		
		var playerPositions = lines.map({ ($0, 0) })
		var nextDieRoll = 1
		var dieRolls = 0
		var playerTurn = 0
		while true {
			let dieSum = nextDieRoll + (nextDieRoll + 1) + (nextDieRoll + 2)
			nextDieRoll += 3
			dieRolls += 3
			let currentPos = playerPositions[playerTurn].0
			let newPos = ((currentPos + dieSum - 1) % 10) + 1
			let currentScore = playerPositions[playerTurn].1
			playerPositions[playerTurn] = (newPos, currentScore + newPos)
			
			if playerPositions[playerTurn].1 >= 1000 {
//				print(playerPositions)
				let otherScore = playerPositions[(playerTurn + 1) % 2].1
				return "\(otherScore * dieRolls)"
			}
			
			playerTurn += 1
			playerTurn %= playerPositions.count
		}
	}
	
	func dirac(player1Pos: Int, player1Score: Int, player2Pos: Int, player2Score: Int, playerTurn: Int, depth: Int) -> (Int, Int) {
//		let depthS = String(Array<Character>(repeating: " ", count: depth*2))
//		print("\(depthS)[\(depth)]: Player1: \(player1Pos), \(player1Score). Player2: \(player2Pos), \(player2Score). It is \(playerTurn + 1)'s turn.")
		if player1Score >= 21 {
//			print("\(depthS)[\(depth)]: Player 1 wins.")
			return (1, 0)
		}
		if player2Score >= 21 {
//			print("\(depthS)[\(depth)]: Player 2 wins.")
			return (0, 1)
		}
		
		/*
		 3 1 1 1
		 4 1 1 2 1 2 1 2 1 1
		 5 1 1 3 1 2 2 1 3 1 2 1 2 2 2 1 3 1 1
		 6 1 2 3 1 3 2 2 1 3 2 2 2 2 3 1 3 1 2 3 2 1
		 7 1 3 3 2 2 3 2 3 2 3 1 3 3 2 2 3 3 1
		 8 2 3 3 3 2 3 3 3 2
		 9 3 3 3
		 */
		let splits = [(3, 1), (4, 3), (5, 6), (6, 7), (7, 6), (8, 3), (9, 1)]
		var newPlayer1Wins = 0, newPlayer2Wins = 0
		if playerTurn == 0 {
			for split in splits {
//				print("\(depthS)[\(depth)]: Split=\(split)")
				let (dieRollSum, dieRollSumCount) = split
				let newPlayer1Pos = ((player1Pos + dieRollSum - 1) % 10) + 1
				let (player1Wins, player2Wins) = dirac(player1Pos: newPlayer1Pos, player1Score: player1Score + newPlayer1Pos, player2Pos: player2Pos, player2Score: player2Score, playerTurn: 1, depth: depth+1)
//				print("\(depthS)[\(depth)]: Split=\(split). player1Wins=\(player1Wins), player2Wins=\(player2Wins)")
				newPlayer1Wins += player1Wins * dieRollSumCount
				newPlayer2Wins +=  player2Wins * dieRollSumCount
//				print("\(depthS)[\(depth)]: Split=\(split). newPlayer1Wins=\(newPlayer1Wins), newPlayer2Wins=\(newPlayer2Wins)")
			}
		} else {
			for split in splits {
//				print("\(depthS)[\(depth)]: Split=\(split)")
				let (dieRollSum, dieRollSumCount) = split
				let newPlayer2Pos = ((player2Pos + dieRollSum - 1) % 10) + 1
				let (player1Wins, player2Wins) = dirac(player1Pos: player1Pos, player1Score: player1Score, player2Pos: newPlayer2Pos, player2Score: player2Score + newPlayer2Pos, playerTurn: 0, depth: depth+1)
//				print("\(depthS)[\(depth)]: Split=\(split). player1Wins=\(player1Wins), player2Wins=\(player2Wins)")
				newPlayer1Wins += player1Wins * dieRollSumCount
				newPlayer2Wins +=  player2Wins * dieRollSumCount
//				print("\(depthS)[\(depth)]: Split=\(split). newPlayer1Wins=\(newPlayer1Wins), newPlayer2Wins=\(newPlayer2Wins)")
			}
		}
//		print("\(depthS)[\(depth)]: Finished. newPlayer1Wins=\(newPlayer1Wins), newPlayer2Wins=\(newPlayer2Wins)")
		return (newPlayer1Wins, newPlayer2Wins)
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
//		for a in 1...3 {
//			for b in 1...3 {
//				for c in 1...3 {
//					print(a+b+c, a, b, c)
//				}
//			}
//		}
		let (player1Wins, player2Wins) = dirac(player1Pos: lines[0], player1Score: 0, player2Pos: lines[1], player2Score: 0, playerTurn: 0, depth: 0)
//		print(player1Wins, player2Wins)
		return "\(max(player1Wins, player2Wins))"
	}
	
	func parse(input: String) -> [Int] {
		return input
			.components(separatedBy: "\n")
			.map({ Int($0.components(separatedBy: ": ")[1])! })
	}
}
