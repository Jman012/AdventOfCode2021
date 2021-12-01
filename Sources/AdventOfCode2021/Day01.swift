import Foundation

struct Day01: Challenge {
	
	func solvePart1(input: String) {
		let numbers = input.parseLinesToInts()
		let increases = findIncreases(numbers: numbers)
		print(increases)
	}
	
	func solvePart2(input: String) {
		let numbers = input.parseLinesToInts()
		let slidingNumbers = zip(numbers.dropFirst().dropFirst(), zip(numbers.dropFirst().dropLast(), numbers.dropLast().dropLast()))
			.map { zip in
				zip.0 + zip.1.0 + zip.1.1
			}
		let increases = findIncreases(numbers: slidingNumbers)
		print(increases)
	}
	
	func findIncreases<T>(numbers: T) -> Int where T: Sequence, T.Element == Int {
		return zip(numbers.dropLast(), numbers.dropFirst())
			.reduce(0, { result, item in
				item.0 < item.1 ? result + 1 : result
			})
	}
}
