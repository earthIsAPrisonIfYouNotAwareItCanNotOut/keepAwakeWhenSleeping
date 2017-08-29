/// common programming errors

// the errors include
//   variables are always initialized before use
//   array indices are checked for out-of-bounds errors
//   integers are checked for overflow
//   optionals ensure that nil values are handled explicitly
//   memory is managed automatically
//   error handling allows controlled recovery from unexpected failures


/// version compatibility

// the default version of swift 4 that's included in Xcode 9
//   when swift 4 compiler is working with swift 3 code
//     it identifies its language version as 3.2
//   when you use Xcode 9 to build swift 3 code
//     most of the new swift 4 functionality is available


//// simple values

/// hello world

print("Hello, world!")

/// variable and constant

var myVariable = 42
myVariable = 50
let myConstant = 42

/// initial value

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

/// a simple way to include variables in strings

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

/// the strings that take up multiple lines

let quotation = """
Even though there's whitespace to the left,
the actual lines aren't indented.
Except for this line.
Double quotes (\") can appear without being escaped.

I still have \(apples + oranges) pieces of fruit.
"""

/// create arrays and dictionaries

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

/// to create an empty array or dictionary

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// if type information can be inferred, you can write

shoppingList = []
ccupations = [:]


//// control flow

/// if and for-in

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

/// optional value

// write a question mark (?)
//   after the type of a value to mark the value as optioanal

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

/// default value

// another way to handle optional values
//   is to provide a default value using the ?? operator

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

/// switch structure

// notice the default case at the end of structure
// execution doesn't continue to the next case
//   so there is no need to add break at the end of each case

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

/// for-in iterate over items in a dictionary

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

/// while structure

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

// the condition of a loop can be at the end instead

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

// use ..< to make a range that omit its upper value
//     ... to make a range that includes both values

var total = 0
for i in 0..<4 {
    total += i
}
print(total)


//// function and closures

/// declare a function

// use func to declare a function
// use -> to set the function's return type

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person:"Bob", day: "Tuesday")

/// no argument label

// write a custom argument label before the parameter name
// or write _ to use no argument label

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

/// return a tuple

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

/// funtions can be nested

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

/// a function can return another function as its value

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

/// take function as arguments

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

/// functions are actually a special case of closures

// blocks of code that can be called later

numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

/// omit the type of patameters and its return type

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

/// you can refer to parameters by number instead of by name

// the $0 represent the first argument
// when a closure is the only argument to a function
//   you can omit the parentheses entirely

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
