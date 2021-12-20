import XCTest
import AdventOfCode2021

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
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "37")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "355989")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "168")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "102245489")
		})
	}
}

final class Day07OptimizedTests: XCTestCase {
	var day: Challenge { Day07Optimized() }
	var input: Input { Inputs.Day07() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "37")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "355989")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "168")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "102245489")
		})
	}
}

final class Day08Tests: XCTestCase {
	var day: Challenge { Day08() }
	var input: Input { Inputs.Day08() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "26")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "369")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "61229")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "1031553")
		})
	}
}

final class Day09Tests: XCTestCase {
	var day: Challenge { Day09() }
	var input: Input { Inputs.Day09() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "15")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "532")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "1134")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "1110780")
		})
	}
}

final class Day10Tests: XCTestCase {
	var day: Challenge { Day10() }
	var input: Input { Inputs.Day10() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "26397")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "341823")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "288957")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "2801302861")
		})
	}
}

final class Day11Tests: XCTestCase {
	var day: Challenge { Day11() }
	var input: Input { Inputs.Day11() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "1656")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "1620")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "195")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "371")
		})
	}
}

final class Day12Tests: XCTestCase {
	var day: Challenge { Day12() }
	var input: Input { Inputs.Day12() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "10")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "3856")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "36")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "116692")
		})
	}
}

final class Day13Tests: XCTestCase {
	var day: Challenge { Day13() }
	var input: Input { Inputs.Day13() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "17")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "693")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "16")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "95")
		})
	}
}

final class Day14Tests: XCTestCase {
	var day: Challenge { Day14() }
	var input: Input { Inputs.Day14() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "1588")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "2345")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "2188189693529")	
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "2432786807053")
		})
	}
}

//final class Day15Tests: XCTestCase {
//	var day: Challenge { Day15() }
//	var input: Input { Inputs.Day15() }
//	func testPart1Example() throws {
//		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "40")
//	}
//	func testPart1Real() throws {
////		print(day.solvePart1(input: input.inputMain1))
//		measure(metrics: metrics, block: {
//			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "540")
//		})
//	}
//	func testPart2Example() throws {
//		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "315")
//	}
//	func testPart2Real() throws {
////		print(day.solvePart2(input: input.inputMain2))
//		measure(metrics: metrics, block: {
//			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "2879")
//		})
//	}
//}

final class Day15OptimizedTests: XCTestCase {
	var day: Challenge { Day15Optimized() }
	var input: Input { Inputs.Day15() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "40")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "540")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "315")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "2879")
		})
	}
}

final class Day16Tests: XCTestCase {
	var day: Challenge { Day16() }
	var input: Input { Inputs.Day16() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: "8A004A801A8002F478"), "16")
		XCTAssertEqual(day.solvePart1(input: "620080001611562C8802118E34"), "12")
		XCTAssertEqual(day.solvePart1(input: "C0015000016115A2E0802F182340"), "23")
		XCTAssertEqual(day.solvePart1(input: "A0016C880162017C3686B18A3D4780"), "31")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "923")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: "C200B40A82"), "3")
		XCTAssertEqual(day.solvePart2(input: "04005AC33890"), "54")
		XCTAssertEqual(day.solvePart2(input: "880086C3E88112"), "7")
		XCTAssertEqual(day.solvePart2(input: "CE00C43D881120"), "9")
		XCTAssertEqual(day.solvePart2(input: "D8005AC2A8F0"), "1")
		XCTAssertEqual(day.solvePart2(input: "F600BC2D8F"), "0")
		XCTAssertEqual(day.solvePart2(input: "9C005AC2F8F0"), "0")
		XCTAssertEqual(day.solvePart2(input: "9C0141080250320F1802104A08"), "1")
	}
	func testPart2Real() throws {
		print(day.solvePart2(input: input.inputMain2))
//		measure(metrics: metrics, block: {
//			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "258888628940")
//		})
	}
}

final class Day17Tests: XCTestCase {
	var day: Challenge { Day17() }
	var input: Input { Inputs.Day17() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "45")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "7503")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "112")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "3229")
		})
	}
}

final class Day18Tests: XCTestCase {
	var day: Challenge { Day18() }
	var input: Input { Inputs.Day18() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: input.inputExample1), "4140")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: input.inputMain1))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart1(input: input.inputMain1), "2501")
		})
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: input.inputExample2), "3993")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: input.inputMain2))
		measure(metrics: metrics, block: {
			XCTAssertEqual(day.solvePart2(input: input.inputMain2), "4935")
		})
	}
}

final class Day19Tests: XCTestCase {
	var day: Challenge { Day19() }
	var input: Input { Inputs.Day19() }
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

final class Day20Tests: XCTestCase {
	var day: Challenge { Day20() }
	var input: Input { Inputs.Day20() }
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
