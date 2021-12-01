import XCTest
@testable import AdventOfCode2021

final class Day01Tests: XCTestCase {
	func testDay01Part1Example() throws {
		Day01().solvePart1(input: Inputs.Day01.inputExample)
	}
	func testDay01Part1Real() throws {
		Day01().solvePart1(input: Inputs.Day01.inputMain)
	}
	func testDay01Part2Example() throws {
		Day01().solvePart2(input: Inputs.Day01.inputExample)
	}
	func testDay01Part2Real() throws {
		Day01().solvePart2(input: Inputs.Day01.inputMain)
	}
}
