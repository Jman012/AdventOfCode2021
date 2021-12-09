import Foundation
func measure(prefix: String, _ block: () -> ()) {
	let begin = Date()
	block()
	let end = Date()
	print("[\(prefix)] Done in \(end.timeIntervalSince(begin))s")
}

let days: [(Challenge, Input)] = [
	(Day01(), Inputs.Day01()),
	(Day02(), Inputs.Day02()),
	(Day03(), Inputs.Day03()),
	(Day04(), Inputs.Day04()),
	(Day05(), Inputs.Day05()),
	(Day06(), Inputs.Day06()),
	(Day07(), Inputs.Day07()),
	(Day07Optimized(), Inputs.Day07()),
	(Day08(), Inputs.Day08()),
	(Day09(), Inputs.Day09()),
]

for day in days {
	measure(prefix: "\(day.0.self) Part 1") {
		_ = day.0.solvePart1(input: day.1.inputMain1)
	}
	measure(prefix: "\(day.0.self) Part 2") {
		_ = day.0.solvePart2(input: day.1.inputMain2)
	}
}
