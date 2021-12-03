import XCTest
@testable import AdventOfCode2021

final class Day01Tests: XCTestCase {
	var day: Challenge { Day01() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: Inputs.Day01.inputExample), "7")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: Inputs.Day02.inputMain))
		XCTAssertEqual(day.solvePart1(input: Inputs.Day01.inputMain), "1616")
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: Inputs.Day01.inputExample), "5")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: Inputs.Day02.inputMain))
		XCTAssertEqual(day.solvePart2(input: Inputs.Day01.inputMain), "1645")
	}
}

final class Day02Tests: XCTestCase {
	var day: Challenge { Day02() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: Inputs.Day02.inputExample), "150")
	}
	func testPart1Real() throws {
//		print(day.solvePart1(input: Inputs.Day02.inputMain))
		XCTAssertEqual(day.solvePart1(input: Inputs.Day02.inputMain), "1383564")
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: Inputs.Day02.inputExample), "900")
	}
	func testPart2Real() throws {
//		print(day.solvePart2(input: Inputs.Day02.inputMain))
		XCTAssertEqual(day.solvePart2(input: Inputs.Day02.inputMain), "1488311643")
	}
}

final class Day03Tests: XCTestCase {
	var day: Challenge { Day03() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: Inputs.Day03.inputExample), "")
	}
	func testPart1Real() throws {
		print(day.solvePart1(input: Inputs.Day02.inputMain))
		XCTAssertEqual(day.solvePart1(input: Inputs.Day03.inputMain), "")
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: Inputs.Day03.inputExample2), "")
	}
	func testPart2Real() throws {
		print(day.solvePart2(input: Inputs.Day02.inputMain))
		XCTAssertEqual(day.solvePart2(input: Inputs.Day03.inputMain2), "")
	}
}

