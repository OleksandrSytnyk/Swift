

let myAge: Int = 53
var averageAge: Double = Double(myAge)
averageAge = 41.5

let coordinates: (Double, Int) = (2.1, 3)
let x: Double = coordinates.0
let y: Int = coordinates.1

let twoIntegers = (2, 5)
let IntegerOne = twoIntegers.0

var coordinatesNamed: (x1: Int, y1: Int) = (2, 3)
coordinatesNamed.0 = 1
var x1: Int = coordinatesNamed.x1
x1 = 2
let y1: Int = coordinatesNamed.y1

var coordinates3D: (x2: Int, y2: Int, z2: Int) = (2, 3, 1)
let (x2, y2, z2) = coordinates3D

//The code is equivalent to the following:
/*let coordinates3D: (x2: Int, y2: Int, z2: Int) = (2, 3, 1)
let x2 = coordinates3D.x
let y2 = coordinates3D.y
let z2 = coordinates3D.z*/

var (x3, y3, _) = coordinates3D
(x3,y3) = (5, 6)
//if you were performing a 2D calculation and wanted to ignore the z3-coordinate. Иными словами, мы здесь ищем проекцию точки на плоскость (x,y)

var temperature: (month: Int, day: Int, year: Int, averageTemperature: Double) = (10, 22, 1962, 17.2)
let (_, Day, _, Temperature) = temperature
let a = Temperature
let b = Day
temperature.averageTemperature = 19



let add = 2 + 6
let subtract = 10 - 2
let multiply = 2 * 4
let divide = 24 / 3

let shiftLeft = 1 << 3
//сдвигает 1 на 3 разрада влево в двоичной форме числа до 1000, т.е. 8
let shiftRight = 32 >> 2
//сдвигает 32 или в двоичной форме 100000 на два разрада вправо до 1000, т.е. 8

var start = 8
let prefix = ++start
// prefix = 9
// start = 9
let postfix = start++
// postfix = 9
// start = 10

var counter = 1
counter += 5
counter -= 2

var counter1 = 10
counter1 *= 3
counter1 /= 2

let hourlyRate = 19.5
let hoursWorked = 10
let totalCost = hourlyRate * Double(hoursWorked)

let testNumber = 100
let evenOdd = testNumber % 2
// остаток от деления (модуль числа от деления на два) равен 0

var answer = 0
++answer
answer += 10
answer *= 10
answer >>= 3
answer

let yes: Bool = true
let no = false
let doesOneEqualTwo = (1 == 2)

/*Boolean AND is &&, Boolean OR is ||, */

let andTrue = 1 < 2 && 4 > 3
let orFalse = 1 == 2 || 3 == 4
let andOr = (1 < 2 && 3 > 4) || 1 < 4

/*  Equal: ==
Not equal: !=
Less than: <
Greater than: >
Less than or equal: <=
Greater than or equal: >=   */

let characterA: Character = "a"
let stringDog: String = "Dog"

var message = "Hello" + " my name is "
let name = "Matt"
message += name
//Concatenation of strings
let exclamationMark: Character = "!"
message += String(exclamationMark)

let name1 = "Matt"
let message1 = "Hello my name is \(name1)!"
//it's Interpolation

let stringA = "café"
let stringB = "cafe\u{0301}"
let equal = stringA == stringB

let c = "\u{63}"
//c латинское имеет код 99. За u стоит этот код, равный 99 но в 16-ти ричной системе
// 99 = 16 * 6 + 3
let thumb = "\u{1F44D}"
//decimal code is 128077
let brown = "\u{1F3FD}"
//decimal code is 127997
let brownthumb = "\u{1F44D}\u{1F3FD}"

let stringA1 = "café"
let stringB1 = "cafe\u{0301}"
stringA.characters.count
stringB.characters.count
//the counts are equil because it's counting the number of grapheme clusters but not characters.

var string = "Swift Apprentice is a great book!"
string.uppercaseString
string.lowercaseString

let firstName = "Oleksandr"
let lastName = "Sytnyk"
let fullName = firstName + " " + lastName
"My name is \(fullName). You can call me \(firstName)"

let value = 10
let multiplier = 5
let sum = "\(value) multiplied by \(multiplier) equals \(value * multiplier)"


let ab = 5
let ba = 10
let min1 = ab < ba ? ab : ba
let max1 = ab > ba ? ab : ba
//The ternary conditional operator (<CONDITION>) ? <TRUE VALUE> : <FALSE VALUE>. Because finding the greater or smaller of two numbers is such a common operation, the Swift standard library provides two functions for this purpose: max and min.
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red". If userDefinedColorName is not nil, then colorNameToUse will set to userDefinedColorName's value

string = "Dog"
switch (string) {
case "Cat", "Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}

let number = 10
switch (number) {
case let y where y % 2 == 0:
    print("Even")
default:
    print("Odd")
}
//здесь y - это такой number, что его остаток от деления на 2 равен 0 

 let newCoordinates: (x: Int, y: Int, z: Int) = (0, 0, 5)
switch (newCoordinates) {
case (0, 0, 0): // 1
    print("Origin")
case (_, 0, 0): // 2
    print("On the x-axis.")
case (0, _, 0): // 3
    print("On the y-axis.")
case (0, 0, _): // 4
    print("On the z-axis.")
default:        // 5
    print("Somewhere in space")
}

let newerCoordinates: (x: Int, y: Int, z: Int) = (0, 0, 5)
switch (newerCoordinates) {
case (0, 0, 0):
    print("Origin")
case (let x, 0, 0):
    print("On the x-axis at x = \(x)")
case (0, let y, 0):
    print("On the y-axis at y = \(y)")
case (0, 0, let z):
    print("On the z-axis at z = \(z)")
case (let x, let y, let z):
    print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

let newestCoordinates: (x: Int, y: Int, z: Int) = (0, 0, 5)
switch (newestCoordinates) {
case (let x, let y, _) where y == x:
    print("Along the y = x line.")
case (let x, let y, _) where y == x * x:
    print("Along the y = x^2 line.")
default:
    break
}

let personAge: (name: String, age: Int) = ( "Oleksandr", 53)
switch (personAge) {
case ( let name, let x ) where x < 0:
    print("The number is incorrect")
    case ( let name, let x ) where x < 3:
    print("\(name) is an infant")
case ( let name, let x) where x < 13:
    print("\(name) is a child")
case ( let name, let x) where x < 20:
    print("\(name) is a teenager")
case ( let name, let x) where x < 40:
    print("\(name) is an adult")
case ( let name, let x) where x < 61:
    print("\(name) is a middle aged")
default: print("eldery")
}


let hourOfDay = 15
let timeOfDay: String
switch (hourOfDay) {
case 0, 1, 2, 3, 4, 5:
    timeOfDay = "Early morning"
case 6, 7...11:
    timeOfDay = "Morning"
case 12..<14, 14...16:
    timeOfDay = "Afternoon"
case 17...19:
    timeOfDay = "Evening"
case 20..<24:
    timeOfDay = "Late evening"
default:
    timeOfDay = "INVALID HOUR!"
}
//a Range is a representation of a sequence of numbers. Let's look at two types of Range. Closed range is for example closedRange = 0...5. The three dots (...) indicate that this range is closed, which means the range goes from 0 to 5, inclusive of both 0 and 5. That's the numbers (0, 1, 2, 3, 4, 5). halfOpenRange = 0..<5 is a half-open range that means the range goes from 0 to 5, inclusive of 0 but not of 5. That's the numbers (0, 1, 2, 3, 4).

let count = 10
var sum1 = 0
for var i = 1; i <= count; i++ {
    sum1 += i
}
sum1
//for <INITIAL CONDITION>; <LOOP CONDITION>; <ITERATION CODE> {<LOOP CODE> }
//for loop

var sum2 = 0
for i in 1...count {
    sum2 += i }
//for-in loops are desirable over standard for loops wherever possible.

var sum3 = 1
var lastSum = 0
for _ in 0..<count {
    let temp = sum3
    sum3 = sum3 + lastSum
    lastSum = temp
}
sum3
//This code doesn't require the loop variable; the loop simply needs to run a certain number of times.

var sum4 = 1
while sum4 < 1000 {
    sum4 = sum4 + (sum4 + 1)
}
//while <CONDITION> { <LOOP CODE>} - while loop


var sum5 = 1
repeat {
    sum5 = sum5 + (sum5 + 1)
} while sum5 < 1000
// repeat {<LOOP CODE>} while <CONDITION> - repeat-while loop.

var sumBreak = 1
while true {
    sumBreak = sumBreak + (sumBreak + 1)
    if (sumBreak >= 1000) {
        break
    } }


var sumContinue = 0
for row in 0..<8 {
    if row % 2 == 0 {
        continue
    }
    for column in 0..<8 {
        sumContinue += row * column
    }
}
//the continue keyword immediately finishes the current iteration of the loop and begins the next iteration.

var labeledStatementSum = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        labeledStatementSum += row * column
    }
}
// This last code block makes use of labeled statements, labeling the two loops as the rowLoop and the columnLoop, respectively. When the row equals the column inside the inner columnLoop, the outer rowLoop will continue. 
//break and continue works with both for loops and while loops. You can use labeled statements with break too. Normally, break and continue work on the inner-most loop, so you need to use labeled statements if you want to manipulate an outer loop.

var aLotOfAs = ""
while message.characters.count < 10 {
    aLotOfAs += "a"
}

func printMultipleOfFive(multiplier: Int) {
    print("\(multiplier) * 5 = \(multiplier * 5)")
}
printMultipleOfFive(10)

func printMultipleOf(multiplier: Int, andValue: Int = 1) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(4, andValue: 2)
printMultipleOf(4)
//The quontity of parameters difference means that if no value is given for the second parameter, it defaults to 1.
func printMultipleOf(multiplier: Int, and andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(4, and: 2)

func printMultipleOf(multiplier: Int, _ andValue: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(4, 2)

//To declare that a function returns a value, between the set of parentheses and before the opening brace, you add a -> followed by the type of the return value. Inside the function, you use the return keyword to return the value. 

func multiplyAndDivide(number: Int, by byValue: Int) -> (multiply: Int,
divide: Int) {
    return (number * byValue, number / byValue)
}
let result = multiplyAndDivide(4, by: 2)
let multiply1 = result.multiply
let divide1 = result.divide
//It's also possible to return multiple values through the use of tuples

func incrementAndPrint(var value: Int) {
    value++
    print(value)
}
//Parameters passed to functions are constants by default, which means they can't be modified. you can change this behavior by making the parameter a variable.
var value1 = 5
incrementAndPrint(value1)
print(value1)
//the method incrementAndPrint(value1) prints 6, but the method print(value1) prints 5. It's because Integers are value type variable (pass-by-value behavior).

func incrementAndPrintInOut(inout value: Int) {
    value++
    print(value)
}
 value1 = 5
incrementAndPrintInOut(&value1)
print(value1)
//The inout keyword before the  function parameter name indicates that this parameter should use pass-by-reference. An ampersand (&) before the parameter turn type into pass-by-reference. Both methods prints 6 this time.

var result1 = max(10, 20)
result1 = min(10, 20)
result1 = abs(-100)

func printFullName (firstName: String, _ lastName: String ) {
    print("\(firstName) \(lastName)")
}
printFullName("Oleksandr", "Sytnyk")

func calculateFullName (firstName: String, _ lastName: String ) -> String {
    return firstName + " " + lastName
}
calculateFullName("Oleksandr", "Sytnyk")

func personalData (firstName: String, _ lastName: String ) -> (fullName: String, nameLengh: Int){
    let name = firstName + " " + lastName
    return (name, name.characters.count)
}

personalData("Oleksandr", "Sytnyk")

func add(a: Int, _ b: Int) -> Int {
    return a + b
}
var function: (Int, Int) -> Int = add
//Here, the name of the variable is function and its type is (Int, Int) -> Int. Really it's a function of functions of type (Int, Int) -> Int, so it's a functional.
var result5 = function(4, 2)
func subtract(a: Int, _ b: Int) -> Int {
    return a - b }
 function = subtract
 result5 = function(4, 2)

func printResult(function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(add, 4, 2)
//The fact that you can assign functions to variables comes in handy because it means you can pass functions to other functions.

