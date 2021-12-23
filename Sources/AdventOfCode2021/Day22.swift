import Foundation

public struct Day22: Challenge {
	
	public init() {}
	
	struct Vec3: Hashable, Equatable {
		let x: Int
		let y: Int
		let z: Int
	}
	
	struct Box: Hashable, Equatable {
		let cornerMin: Vec3
		let cornerMax: Vec3
		
		var cubeCount: Int {
			(cornerMax.x - cornerMin.x) * (cornerMax.y - cornerMin.y) * (cornerMax.z - cornerMin.z)
		}
		
		func doesIntersect(other: Box) -> Bool {
//			let entirelyContains = self.cornerMin.x <= other.cornerMin.x && self.cornerMin.y <= other.cornerMin.y && self.cornerMin.z <= other.cornerMin.z
//				&& other.cornerMax.x <= self.cornerMax.x && other.cornerMax.y <= self.cornerMax.y && other.cornerMax.z <= self.cornerMax.z
//			let entirelyWithin = other.cornerMin.x <= self.cornerMin.x && other.cornerMin.y <= self.cornerMin.y && other.cornerMin.z <= self.cornerMin.z
//				&& self.cornerMax.x <= other.cornerMax.x && self.cornerMax.y <= other.cornerMax.y && self.cornerMax.z <= other.cornerMax.z
////			let regularIntersect =
			return (
				(self.cornerMin.x < other.cornerMax.x || self.cornerMax.x > other.cornerMin.x) || // x plane intersects
				(self.cornerMin.y < other.cornerMax.y || self.cornerMax.y > other.cornerMin.y) || // y plane intersects
				(self.cornerMin.z < other.cornerMax.z || self.cornerMax.z > other.cornerMin.z)    // z plane intersects
			)
		}
		
		func intersectionBoxes(other: Box) -> [Box] {
			let xes: [(Int, Bool)] = [
				(self.cornerMin.x, true),
				(self.cornerMax.x, true),
				(other.cornerMin.x, false),
				(other.cornerMax.x, false),
			].sorted(by: { $0.0 < $1.0 })
			let yes: [(Int, Bool)] = [
				(self.cornerMin.y, true),
				(self.cornerMax.y, true),
				(other.cornerMin.y, false),
				(other.cornerMax.y, false),
			].sorted(by: { $0.0 < $1.0 })
			let zes: [(Int, Bool)] = [
				(self.cornerMin.z, true),
				(self.cornerMax.z, true),
				(other.cornerMin.z, false),
				(other.cornerMax.z, false),
			].sorted(by: { $0.0 < $1.0 })
			
			var newBoxes: [Box] = []
			for (xIndex, xPair) in zip(xes.dropLast(), xes.dropFirst()).enumerated() {
				for (yIndex, yPair) in zip(yes.dropLast(), yes.dropFirst()).enumerated() {
					for (zIndex, zPair) in zip(zes.dropLast(), zes.dropFirst()).enumerated() {
						let newBox = Box(cornerMin: Vec3(x: xPair.0.0, y: yPair.0.0, z: zPair.0.0),
										 cornerMax: Vec3(x: xPair.1.0, y: yPair.1.0, z: zPair.1.0))
						/*
						 ---SX1---SX2---OX1---OX2---
						 ---OX1---OX2---SX1---SX2---
						 ---SX1---OX1---OX2---SX2---
						 ---OX1---SX1---SX2---OX2---
						 ---SX1---OX1---SX2---OX2---
						 ---OX1---SX1---OX2---SX2---
						 */
						let isSelfX = (xIndex == 0 && xPair.0.1) || (xIndex == 1 && xPair.0.1 && !xPair.1.1) || (/*xIndex == 2 &&*/ xPair.0.1 && xPair.1.1)
						let isSelfY = (yIndex == 0 && yPair.0.1) || (yIndex == 1 && yPair.0.1 && !yPair.1.1) || (/*yIndex == 2 &&*/ yPair.0.1 && yPair.1.1)
						let isSelfZ = (zIndex == 0 && zPair.0.1) || (zIndex == 1 && zPair.0.1 && !zPair.1.1) || (/*zIndex == 2 &&*/ zPair.0.1 && zPair.1.1)
//						let isSelf = (isSelfX && isSelfY) || (isSelfY && isSelfZ) || (isSelfX && isSelfZ)
						let isSelf = isSelfX && isSelfY && isSelfZ
						if isSelf {
							newBoxes.append(newBox)
						}
					}
				}
			}
			
			return newBoxes.filter({ $0.cubeCount > 0 })
		}
		
		func intersectionCubeCount(other: Box) -> Int {
			let xIntersection: Int, yIntersection: Int, zIntersection: Int
			if self.cornerMax.x < other.cornerMin.x || self.cornerMin.x > other.cornerMax.x {
				xIntersection = 0
			} else if self.cornerMin.x < other.cornerMin.x && other.cornerMax.x < self.cornerMax.x {
				xIntersection = other.cornerMax.x - other.cornerMin.x
			} else if other.cornerMin.x < self.cornerMin.x && self.cornerMax.x < other.cornerMax.x {
				xIntersection = self.cornerMax.x - self.cornerMin.x
			} else if self.cornerMin.x < other.cornerMin.x && other.cornerMin.x < self.cornerMax.x {
				xIntersection = self.cornerMax.x - other.cornerMin.x
			} else /*if other.cornerMin.x < self.cornerMin.x && self.cornerMin.x < other.cornerMax.x*/ {
				xIntersection = other.cornerMax.x - self.cornerMin.x
			}
			
			if self.cornerMax.y < other.cornerMin.y || self.cornerMin.y > other.cornerMax.y {
				yIntersection = 0
			} else if self.cornerMin.y < other.cornerMin.y && other.cornerMax.y < self.cornerMax.y {
				yIntersection = other.cornerMax.y - other.cornerMin.y
			} else if other.cornerMin.y < self.cornerMin.y && self.cornerMax.y < other.cornerMax.y {
				yIntersection = self.cornerMax.y - self.cornerMin.y
			} else if self.cornerMin.y < other.cornerMin.y && other.cornerMin.y < self.cornerMax.y {
				yIntersection = self.cornerMax.y - other.cornerMin.y
			} else /*if other.cornerMin.y < self.cornerMin.y && self.cornerMin.y < other.cornerMax.y*/ {
				yIntersection = other.cornerMax.y - self.cornerMin.y
			}
			
			if self.cornerMax.z < other.cornerMin.z || self.cornerMin.z > other.cornerMax.z {
				zIntersection = 0
			} else if self.cornerMin.z < other.cornerMin.z && other.cornerMax.z < self.cornerMax.z {
				zIntersection = other.cornerMax.z - other.cornerMin.z
			} else if other.cornerMin.z < self.cornerMin.z && self.cornerMax.z < other.cornerMax.z {
				zIntersection = self.cornerMax.z - self.cornerMin.z
			} else if self.cornerMin.z < other.cornerMin.z && other.cornerMin.z < self.cornerMax.z {
				zIntersection = self.cornerMax.z - other.cornerMin.z
			} else /*if other.cornerMin.z < self.cornerMin.z && self.cornerMin.z < other.cornerMax.z*/ {
				zIntersection = other.cornerMax.z - self.cornerMin.z
			}
			
			return xIntersection * yIntersection * zIntersection
		}
	}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		let lines2: [(Bool, Int, Int, Int, Int, Int, Int)] = lines
			.filter({
				!($0.1 > 50 || $0.2 < -50 || $0.3 > 50 || $0.5 < -50 || $0.5 > 50 || $0.6 < -50)
			})
			.map({ (line) -> (Bool, Int, Int, Int, Int, Int, Int) in
				let xMin = max(-50, min(50, line.1))
				let xMax = max(-50, min(50, line.2))
				let yMin = max(-50, min(50, line.3))
				let yMax = max(-50, min(50, line.4))
				let zMin = max(-50, min(50, line.5))
				let zMax = max(-50, min(50, line.6))
				return (line.0, xMin, xMax, yMin, yMax, zMin, zMax)
			})
		print(lines2)
		var coords: [Vec3: Bool] = [:]
		for line in lines2 {
			for x in line.1...line.2 {
				for y in line.3...line.4 {
					for z in line.5...line.6 {
						coords[Vec3(x: x, y: y, z: z)] = line.0
					}
				}
			}
		}
		
		let count = coords.values.filter({ $0 }).count
		return "\(count)"
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		let boxes = lines.map({
			($0.0, Box(cornerMin: Vec3(x: $0.1, y: $0.3, z: $0.5), cornerMax: Vec3(x: $0.2, y: $0.4, z: $0.6)))
		})
		var count = 0
		for i in 0..<boxes.count {
			let on = boxes[i].0
			let box = boxes[i].1
			
			if on {
				count += box.cubeCount
			}
			
			for iPrevBox in 0..<i {
				let prevOn = boxes[iPrevBox].0
				let prevBox = boxes[iPrevBox].1
				let intersectionCubeCount = box.intersectionCubeCount(other: prevBox)
				if prevOn && on {
					count -= intersectionCubeCount
				} else if !prevOn && on {
					// Nothing
				} else if prevOn && !on {
					count -= intersectionCubeCount
				} else /* !prevOn && !on */ {
					// Nothing
				}
			}
		}
		return "\(count)"
		
//		var boxes = Set<Box>()
//
//		for newBoxLine in lines {
//			let newBox = Box(cornerMin: Vec3(x: newBoxLine.1, y: newBoxLine.3, z: newBoxLine.5), cornerMax: Vec3(x: newBoxLine.2, y: newBoxLine.4, z: newBoxLine.6))
//			print("New \(newBoxLine.0 ? "true" : "false") box: \(newBox)")
//			let boxesThatIntersect = boxes.filter({ $0.doesIntersect(other: newBox) })
//			print("  Found \(boxesThatIntersect.count) existing boxes that intersect.")
//			for originalBox in boxesThatIntersect {
//				let explodedBoxes = originalBox.intersectionBoxes(other: newBox)
//				boxes.remove(originalBox)
//				for explodedBox in explodedBoxes {
//					boxes.insert(explodedBox)
//				}
//			}
//			if newBoxLine.0 {
//				boxes.insert(newBox)
//			}
//		}
//
//		let count = boxes.map({ $0.cubeCount }).reduce(0, +)
//
//		return "\(count)"
	}
	
	func parse(input: String) -> [(Bool, Int, Int, Int, Int, Int, Int)] {
		return input
			.components(separatedBy: "\n")
			.map({ (line) -> (Bool, Int, Int, Int, Int, Int, Int) in
				let split1 = line.split(separator: " ")
				let state = split1[0] == "on"
				let split2 = split1[1].split(separator: ",")
				let xSplit = split2[0].dropFirst().dropFirst().components(separatedBy: "..")
				let ySplit = split2[1].dropFirst().dropFirst().components(separatedBy: "..")
				let zSplit = split2[2].dropFirst().dropFirst().components(separatedBy: "..")
				return (state, Int(xSplit[0])!, Int(xSplit[1])!, Int(ySplit[0])!, Int(ySplit[1])!, Int(zSplit[0])!, Int(zSplit[1])!)
			})
	}
}
