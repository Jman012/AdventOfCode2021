import XCTest
@testable import AdventOfCode2021

final class Day01Tests: XCTestCase {
	var day: Challenge { Day01() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: Inputs.Day01.inputExample), "7")
	}
	func testPart1Real() throws {
		XCTAssertEqual(day.solvePart1(input: Inputs.Day01.inputMain), "1616")
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: Inputs.Day01.inputExample), "5")
	}
	func testPart2Real() throws {
		XCTAssertEqual(day.solvePart2(input: Inputs.Day01.inputMain), "1645")
	}
}

final class Day02Tests: XCTestCase {
	var day: Challenge { Day02() }
	func testPart1Example() throws {
		XCTAssertEqual(day.solvePart1(input: Inputs.Day01.inputExample), "7")
	}
	func testPart1Real() throws {
		XCTAssertEqual(day.solvePart1(input: Inputs.Day01.inputMain), "1616")
	}
	func testPart2Example() throws {
		XCTAssertEqual(day.solvePart2(input: Inputs.Day01.inputExample), "5")
	}
	func testPart2Real() throws {
		XCTAssertEqual(day.solvePart2(input: Inputs.Day01.inputMain), "1645")
	}
}

