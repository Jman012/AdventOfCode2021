import Foundation

public struct Day19: Challenge {
	
	struct Vec: Equatable, Hashable {
		let x: Int
		let y: Int
		let z: Int
		
		var description: String {
			"[\(x),\(y),\(z)]"
		}
		
		var negated: Vec {
			Vec(x: -x, y: -y, z: -z)
		}
		
		func add(_ vec: Vec) -> Vec {
			return Vec(x: x + vec.x, y: y + vec.y, z: z + vec.z)
		}
		
		func multiply(_ vec: Vec) -> Vec {
			return Vec(x: x * vec.x, y: y * vec.y, z: z * vec.z)
		}
	}
	
	public init() {}
	
	func rotations(a: Vec) -> [Vec] {
		let facings: [(Vec) -> Vec] = [
			{ Vec(x: $0.x, y: $0.y, z: $0.z) }, // Original forward
			{ Vec(x: $0.z, y: $0.y, z: -$0.x) }, // About face left
			{ Vec(x: -$0.z, y: $0.y, z: $0.x) }, // About face right
			{ Vec(x: -$0.y, y: $0.x, z: $0.z) }, // Look up
			{ Vec(x: $0.y, y: -$0.x, z: $0.z) }, // Look down
			{ Vec(x: -$0.x, y: $0.y, z: -$0.z) }, // Turn backwards
		]
		
		let rotations: [(Vec) -> Vec] = [
			{ Vec(x: $0.x, y: $0.y, z: $0.z) }, // Original
			{ Vec(x: $0.x, y: -$0.z, z: $0.y) }, // 90° CW
			{ Vec(x: $0.x, y: -$0.y, z: -$0.z) }, // 180° CW
			{ Vec(x: $0.x, y: $0.z, z: -$0.y) }, // 270° CW or 90° CCW
		]
		
		var results: [Vec] = []
		for facing in facings {
			for rotation in rotations {
				results.append(rotation(facing((a))))
			}
		}
		return results
	}
	
	func rotateSet(a: [Vec]) -> [[Vec]] {
		var newSets: [[Vec]] = Array(repeating: [Vec](), count: 24)
		for vec in a {
			for (index, rotation) in rotations(a: vec).enumerated() {
				newSets[index].append(rotation)
			}
		}
		return newSets
	}
	
	func doOutputsOverlapWithRotations(a: [Vec], b: [Vec]) -> Bool {
		let aRotatons = rotateSet(a: a)
		let bRotations = rotateSet(a: b)
		for i in 0..<aRotatons.count {
			for j in 0..<bRotations.count {
//				print("a rotation \(i), b rotation \(j)")
				if let matched = doOutputsOverlap(a: aRotatons[i], b: bRotations[j]) {
					print("found match at a rotation \(i), b rotation \(j): \(matched.map({ $0.description }))")
					print(matched.map({ rotations(a: $0)[i].description }))
					return true
				}
			}
		}
		return false
	}
	
	func doOutputsOverlap(a: [Vec], b: [Vec]) -> [Vec]? {
		let aFirst = a.first!
		let diffs = b.map({ aFirst.add($0.negated) })
		for diff in diffs {
			if let matched = doOutputsOverlap(a: a, b: b, diff: diff) {
				return matched
			}
		}
		return nil
	}
	
	func doOutputsOverlap(a: [Vec], b: [Vec], diff: Vec) -> [Vec]? {
		var matched: [Vec] = []
		for aVec in a {
			let potentialBVec = aVec.add(diff.negated)
			if b.contains(potentialBVec) {
				matched.append(aVec)
			}
		}
//		numMatched > 1 ? print("numMatch: \(numMatched)") : nil
		return matched.count >= 12 ? matched : nil
	}
	
	public func solvePart1(input: String) -> String {
//		print(rotations(a: Vec(x: 1, y: 2, z: 3)))
//		let test = parse(input: """
//--- scanner 0 ---
//5,6,-4
//""")
//		let rotations = rotateSet(a: test.first!)
		
		
		let scannerOutputs = parse(input: input)
		
		for i in 0..<scannerOutputs.count {
			for j in i..<scannerOutputs.count {
				if i == j { continue }
				print("scanner \(i) and \(j): \(doOutputsOverlapWithRotations(a: scannerOutputs[i], b: scannerOutputs[j]))")
			}
		}
		
		return ""
	}
	
	public func solvePart2(input: String) -> String {
		let scannerOutputs = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> [[Vec]] {
		return input
			.components(separatedBy: "\n\n")
			.map({ scanner -> [Vec] in
				return [Vec](scanner
					.split(separator: "\n")
					.dropFirst()
					.map({ sVec -> Vec in
						let split = sVec.split(separator: ",")
						return Vec(x: Int(split[0])!, y: Int(split[1])!, z: Int(split[2])!)
					}))
			})
	}
}
