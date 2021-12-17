import Foundation

public struct Day17: Challenge {
	
	struct InputCoords {
		let xLower: Int
		let xUpper: Int
		let yLower: Int
		let yUpper: Int
	}
	
	public init() {}
	
	public func solvePart1(input: String) -> String {
		let inputCoords = parse(input: input)
		var x = 0
		var totalXDistance = 0
		while totalXDistance < inputCoords.xLower || totalXDistance > inputCoords.xUpper {
			if x < inputCoords.xLower {
				x += 1
			} else {
				x -= 1
			}
			totalXDistance = (x * (x + 1)) / 2
		}
//		print("Found optimal x: \(x)")
		
		var y = 10_000
		var yApex = 0
		outer: while true {
			let apex = (y * (y + 1)) / 2
//			print("Trying y=\(y) with apex=\(apex)")
			
			var currentY = y
			var currentYPos = 0
			while true {
				currentYPos += currentY
//				print("Step: currentY=\(currentY), currentYPos=\(currentYPos)")
				if currentYPos >= inputCoords.yLower && currentYPos <= inputCoords.yUpper {
					if apex > yApex {
//						print("This hits the bounding box and the apex is larger. New highest apex. Trying next.")
						yApex = apex
						break
					} else {
//						print("This hits the bounding box but the apex isn't greater. Quitting.")
						break outer
					}
				} else if currentYPos <= inputCoords.yUpper {
//					print("This skips the bounding box. Next.")
					break
				}
				currentY -= 1
			}
			y -= 1
		}
//		print("Found highest apex of \(yApex) with y=\(y-1)")
		return "\(yApex)"
	}
	
	func doesHitBox(inputCoords: InputCoords, x: Int, y: Int) -> Bool {
		var x = x
		var y = y
		var xPos = 0
		var yPos = 0
		
		while true {
			xPos += x
			yPos += y
			
			if inputCoords.xLower <= xPos && xPos <= inputCoords.xUpper && inputCoords.yLower <= yPos && yPos <= inputCoords.yUpper {
				return true
			}
			if xPos > inputCoords.xUpper || yPos < inputCoords.yLower {
				return false
			}
			
			if x > 0 {
				x -= 1
			}
			y -= 1
		}
	}
	
	public func solvePart2(input: String) -> String {
		let inputCoords = parse(input: input)
		var acc = 0
		for x in 1...inputCoords.xUpper {
			for y in inputCoords.yLower..<10_000 {
				if doesHitBox(inputCoords: inputCoords, x: x, y: y) {
					acc += 1
//					print("x=\(x), y=\(y). acc=\(acc)")
				}
			}
		}
		return "\(acc)"
	}
	
	func parse(input: String) -> InputCoords {
		let trimmed = input[input.index(input.startIndex, offsetBy: "target area: x=".count)...]
		let split1 = trimmed.components(separatedBy: ", ")
		let split2 = split1[0].components(separatedBy: "..")
		let split3 = String(split1[1].map({$0})[2...]).components(separatedBy: "..")
		return InputCoords(xLower: Int(split2[0])!, xUpper: Int(split2[1])!, yLower: Int(split3[0])!, yUpper: Int(split3[1])!)
	}
}
