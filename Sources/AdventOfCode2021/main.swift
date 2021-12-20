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
	(Day10(), Inputs.Day10()),
	(Day11(), Inputs.Day11()),
	(Day12(), Inputs.Day12()),
	(Day13(), Inputs.Day13()),
	(Day14(), Inputs.Day14()),
	(Day15(), Inputs.Day15()),
	(Day15Optimized(), Inputs.Day15()),
	(Day16(), Inputs.Day16()),
	(Day17(), Inputs.Day17()),
	(Day18(), Inputs.Day18()),
	(Day19(), Inputs.Day19()),
	(Day20(), Inputs.Day20()),
]

for day in days {
	measure(prefix: "\(day.0.self) Part 1") {
		_ = day.0.solvePart1(input: day.1.inputMain1)
	}
	measure(prefix: "\(day.0.self) Part 2") {
		_ = day.0.solvePart2(input: day.1.inputMain2)
	}
}
