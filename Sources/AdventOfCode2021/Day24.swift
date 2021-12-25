import Foundation

protocol Day24Arg {
	func value(program: Day24.Program) -> Int
}

protocol Day24Op {
	func process(program: Day24.Program)
}

public struct Day24: Challenge {
	
	public init() {}
	
	class Program {
		public var inputs: ArraySlice<Int>
		public var variables: [Character: Int]
		
		init(inputs: ArraySlice<Int>) {
			self.inputs = inputs
			self.variables = [
				"w": 0,
				"x": 0,
				"y": 0,
				"z": 0,
			]
		}
		
		func process(alu: [Day24Op]) {
			for line in alu {
				line.process(program: self)
			}
		}
	}
	
	struct Variable: Day24Arg {
		let name: Character
		
		func value(program: Day24.Program) -> Int {
			return program.variables[name]!
		}
	}
	
	struct Constant: Day24Arg {
		let num: Int
		
		func value(program: Day24.Program) -> Int {
			return num
		}
	}
	
	struct Input: Day24Op {
		let variable: Variable
		
		func process(program: Day24.Program) {
			program.variables[variable.name] = program.inputs.popFirst()!
		}
	}
	
	struct Add: Day24Op {
		let variable: Variable
		let arg: Day24Arg
		
		func process(program: Day24.Program) {
			program.variables[variable.name] = variable.value(program: program) + arg.value(program: program)
		}
	}
	
	struct Multiply: Day24Op {
		let variable: Variable
		let arg: Day24Arg
		
		func process(program: Day24.Program) {
			program.variables[variable.name] = variable.value(program: program) * arg.value(program: program)
		}
	}
	
	struct Divide: Day24Op {
		let variable: Variable
		let arg: Day24Arg
		
		func process(program: Day24.Program) {
			program.variables[variable.name] = variable.value(program: program) / arg.value(program: program)
		}
	}
	
	struct Modulus: Day24Op {
		let variable: Variable
		let arg: Day24Arg
		
		func process(program: Day24.Program) {
			program.variables[variable.name] = variable.value(program: program) % arg.value(program: program)
		}
	}
	
	struct Equal: Day24Op {
		let variable: Variable
		let arg: Day24Arg
		
		func process(program: Day24.Program) {
			program.variables[variable.name] = variable.value(program: program) == arg.value(program: program) ? 1 : 0
		}
	}
	
	public func solvePart1(input: String) -> String {
		let lines = parse(input: input)
		var program = Program(inputs: [2, 6])
		program.process(alu: lines)
		print(program.variables["z"]!)
		
		program = Program(inputs: [2, 7])
		program.process(alu: lines)
		print(program.variables["z"]!)
		return ""
	}
	
	public func solvePart2(input: String) -> String {
		let lines = parse(input: input)
		return ""
	}
	
	func parse(input: String) -> [Day24Op] {
		return input
			.components(separatedBy: "\n")
			.map({ line -> Day24Op in
				let split = line.split(separator: " ")
				let op = split[0]
				let arg1 = split[1]
				let sarg2 = split.dropFirst(2).first
				var arg2: Day24Arg? = nil
				if let sarg2 = sarg2 {
					if let numArg2 = Int(sarg2) {
						arg2 = Constant(num: numArg2)
					} else {
						arg2 = Variable(name: sarg2.first!)
					}
				}
				switch op {
				case "inp":
					return Input(variable: Variable(name: arg1.first!))
				case "add":
					return Add(variable: Variable(name: arg1.first!), arg: arg2!)
				case "mul":
					return Multiply(variable: Variable(name: arg1.first!), arg: arg2!)
				case "div":
					return Divide(variable: Variable(name: arg1.first!), arg: arg2!)
				case "mod":
					return Modulus(variable: Variable(name: arg1.first!), arg: arg2!)
				case "eql":
					return Equal(variable: Variable(name: arg1.first!), arg: arg2!)
				default:
					fatalError()
				}
			})
	}
}
