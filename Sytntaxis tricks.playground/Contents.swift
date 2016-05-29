
func performDifficultCalculation(list: [Double]) {
    if list.count < 2 {
    print("Too few items in list")
    return
    }
    // perform the very difficult calculation here
}

func performDifficultCalculation1(list: [Double]) {
    if list.count < 2 {
    print("Too few items in list")
    } else {
    // perform the very difficult calculation here
    }
}
//The two above are the same


let condition1 = true
let condition2 = true
let condition3 = true
func someMethod() {
    if condition1 {
    if condition2 {
        if condition3 { // statements
    } else {
        // statements
        }
    } else {
        // statements
    }
} else {
// statements
}
}

func someMethod1() {
    if !condition1 {
    // statements
    return
    }
    if !condition2 {
        // statements return
    }
    if !condition3 {
        // statements return
    }
    // statements
}
//You can turn the first above into the second above but statements have to be a little different.

func someMethod2() {
    guard condition1 else {
        // statements
        return
    }
    guard condition2 else {
        // statements
        return
    }
}
//this is the same as someMethod1() including statements. Actually, guard condition === if !condition plus unwrapping optional
//http://ericcerney.com/swift-guard-statement/

