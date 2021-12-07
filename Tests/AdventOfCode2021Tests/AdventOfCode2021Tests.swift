import XCTest
@testable import AdventOfCode2021

let metrics: [XCTMetric] = [
	XCTClockMetric(),
//	XCTMemoryMetric(),
//	XCTCPUMetric(),
]

final class Day01Tests: XCTestCase {
	var day: Challenge { Day01() }
	var input: Input { Inputs.Day01() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "7")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "1616")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "5")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "1645")
		})
	}
}

final class Day02Tests: XCTestCase {
	var day: Challenge { Day02() }
	var input: Input { Inputs.Day02() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "150")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "1383564")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "900")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "1488311643")
		})
	}
}

final class Day03Tests: XCTestCase {
	var day: Challenge { Day03() }
	var input: Input { Inputs.Day03() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "198")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "4191876")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "230")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "3414905")
		})
	}
}

final class Day04Tests: XCTestCase {
	var day: Challenge { Day04() }
	var input: Input { Inputs.Day04() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "4512")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "71708")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "1924")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "34726")
		})
	}
}

final class Day05Tests: XCTestCase {
	var day: Challenge { Day05() }
	var input: Input { Inputs.Day05() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "5")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "6267")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "12")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "20196")
		})
	}
}

final class Day06Tests: XCTestCase {
	var day: Challenge { Day06() }
	var input: Input { Inputs.Day06() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "5934")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "390923")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "26984457539")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "1749945484935")
		})
	}
}

final class Day07Tests: XCTestCase {
	var day: Challenge { Day07() }
	var input: Input { Inputs.Day07() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "")
	}
	func testPart1Real() throws {
		print(day.solvePart1(input: input.inputMain1))
//		measure(metrics: metrics, block: {
//			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "")
//		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "")
	}
	func testPart2Real() throws {
		print(day.solvePart2(input: input.inputMain2))
//		measure(metrics: metrics, block: {
//			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "")
//		})
	}
}
