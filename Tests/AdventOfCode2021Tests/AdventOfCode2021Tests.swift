import XCTest
@testable import AdventOfCode2021

final class Day01Tests: XCTestCase {
	func testDay01Part1Example() throws {
		XCTAssertEqual(Day01().solvePart1(input: Inputs.Day01.inputExample), "7")
	}
	func testDay01Part1Real() throws {
		XCTAssertEqual(Day01().solvePart1(input: Inputs.Day01.inputMain), "1616")
	}
	func testDay01Part2Example() throws {
		XCTAssertEqual(Day01().solvePart2(input: Inputs.Day01.inputExample), "5")
	}
	func testDay01Part2Real() throws {
		XCTAssertEqual(Day01().solvePart2(input: Inputs.Day01.inputMain), "1645")
	}
}
