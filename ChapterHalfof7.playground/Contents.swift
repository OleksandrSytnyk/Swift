//: Playground - noun: a place where people can play

import UIKit

/*func isNumberDivisible(number: Int, by byNumber: Int) -> Bool {
    var answer = false
   if (number % byNumber == 0) {
      //  answer = true
    }
    return answer
}*/
func isNumberDivisible(number: Int, by byNumber: Int) -> Bool {
    return number % byNumber == 0
}
isNumberDivisible(6, by: 5)

/*func isPrime(number: Int) -> Bool {
    if (number > 0) {
        for i in 2...(number - 1) {
          if isNumberDivisible(number, by: i) {
              return false
            }
        }
   }
   return true
}*/
func isPrime(number: Int) -> Bool {
    if number < 0 {
        return false
    }
    
    if number <= 3 {
        return true
    }
    
    let root = Int(sqrt(Double(number)))
    for i in 2...root {
        if isNumberDivisible(number, by: i) {
            return false
        }
    }
    return true
}

isPrime(8893)

func fibonacci(number: Int) -> Int {
    if number <= 0 {
        return 0
    }
    
    if number == 1 || number == 2 {
        return 1
    }
    
    return fibonacci(number - 1) + fibonacci(number - 2)
}
fibonacci(10)

/*func demonstration1 ()
func demonstration: (Int, Int) -> Int
it's impossible for function*/
var multiplyClosure:(Int, Int) -> Int
multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}
let result = multiplyClosure(4, 2)

multiplyClosure = { (a: Int, b: Int) in
    a*b }
//You can use Swift's type inference to shorten the syntax by removing the return type and the return within a closure

multiplyClosure = {
    $0 * $1 }
// if you want you can even omit the parameter list. Swift lets you refer to each parameter by number, starting at zero

func operateOnNumbers(a: Int, _ b: Int,
    operation: (Int, Int) -> Int) -> Int {
        let result = operation(a, b)
        print(result)
        return result
}
let addClosure = { (a: Int, b: Int) in
    a+b }
operateOnNumbers(4, 2, operation: addClosure)

func addFunction(a: Int, b: Int) -> Int {
    return a + b }
operateOnNumbers(4, 2, operation: addFunction)
//the clousure and the function do the same way here

operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
    return a + b })
//the same result here but all the code is one line. But without return it does too
operateOnNumbers(4, 2, operation: {
    $0 + $1 })

operateOnNumbers(4, 2) {
    $0 + $1 }
//0 and 1 are first and second parameters. Removing the operation label and pulling the braces outside of the function call parameter lists is called trailing closure syntax.

let voidClosure: () -> Void = {
    print("Swift Apprentice is awesome!")
}
voidClosure()

var xInt = 2
var check = {
    return xInt + xInt
}
var f = check() + 1

let check1 = {
    return (1, 2, "man")
}
f = check1().0
check1().2
var counter = 0

let incrementCounter2: () -> Int = {
    return counter++
}
incrementCounter2()
counter

let incrementCounter = {
    counter++ }
//The counter variable is defined outside of the closure. The closure is able to access the variable because the closure is defined in the same scope as the variable. The closure is said to capture the counter variable. Any changes it makes to the variable are visible both inside and outside of the closure.
incrementCounter()
incrementCounter()
counter

func incrementCounterCheck() {
    counter++
}
counter
incrementCounterCheck()
counter

func countingClosure() -> (() -> Int) {
    var counter = 0
    let incrementCounter: () -> Int = {
        return counter++
    }
    return incrementCounter
}
let counter1 = countingClosure()
let counter2 = countingClosure()
counter1()
counter2()
counter1()
counter1()
counter2()
//The two counters created by the function are mutually exclusive and count independently.

func repeatTask(times: Int, task: () -> Void) {
    for _ in 0 ..< times {
        task()
    }
}

repeatTask(10, task: { () -> Void in print("Swift Apprentice is a great book!")})

func mathSum(times: Int, operation: (Int) -> Int) -> Int {
    var result = 0
    for i in 1...times {
       result += operation(i)
    }
    return result
}
/*let squareOfNumber: (number: Int) -> Int
squareOfNumber = {(number: Int) -> Int in
    return number * number
}*/

let squareOfNumber = {(number: Int) -> Int in
    return number * number
}


mathSum(4, operation: squareOfNumber)
print(mathSum(4, operation: {(i: Int) -> Int in i * i}))
print(mathSum(4){ i in i * i })
print(mathSum(5) {$0 * $0})

let number1 = 10
//squareOfNumber(number: 10)


let action = UIAlertAction(title: "OK", style: .Default,
    handler: { action in
        2*2
})
