//: Playground - noun: a place where people can play

import UIKit
enum RollingError: ErrorType {
    case Doubles
    case OutOfFunding
}
//The protocol can apply to any type you define, but it's especially well-suited to enumerations. 
var hasFunding = true
func roll(firstDice: Int, secondDice: Int) throws {
    let error: RollingError
    if firstDice == secondDice && hasFunding { // 1
        error = .Doubles
        hasFunding = false
        throw error
    } else if firstDice == secondDice && !hasFunding { // 2
        hasFunding = true
        print("Huzzah! You raise another round of funding!")
    } else if !hasFunding { // 3
        error = .OutOfFunding
        throw error
    } else { // 4
        print("You moved \(firstDice + secondDice) spaces")
}
}
//If you're writing an error-throwing function which is catching and handling the errors, you must use the keyword throws before the return type. In this case when you're calling an error-throwing function, you you don't need to include throws in your method declaration. Since you aren't bubbling up the error any longer, it's no longer a throwing function.

func roll1(firstDice: Int, secondDice: Int) throws {
}//If you're calling an error-throwing function but not handling the errors in that function, you need to include throws in your method declaration.

func move(firstDice: Int, secondDice: Int) -> String {
    do {
        try roll(firstDice, secondDice: secondDice)//Since roll can throw errors, you embed it in a do block. 
        return "Successful roll."
    } catch RollingError.Doubles {
        return "You rolled doubles and have lost your funding"
    } catch RollingError.OutOfFunding {
        return "You need to do another round of funding."
    } catch {
        return "Unknown error"
    }
}
move(1, secondDice: 2)
move(4, secondDice: 4)
move(1, secondDice: 6)




enum Direction {
    case Left
    case Right
    case Forward
}
enum PugBotError: ErrorType {
    case DidNotTurnLeft(directionMoved: Direction)
    case DidNotTurnRight(directionMoved: Direction)
    case DidNotGoForward(directionMoved: Direction)
    case EndOfPath
}
class PugBot {
    let name: String
    let correctPath: [Direction]
    var currentStepInPath = 0
    //it's a special kind of initializer—a failable initializer—that can fail without crashing your app:
    init? (name: String, correctPath: [Direction]) {
        self.correctPath = correctPath
        self.name = name
        // 1
        guard (correctPath.count > 0) else {return nil}
        // 2
        switch name {
        case "Delia", "Olive", "Frank", "Otis", "Doug":
            break
        default:
            return nil
        } }
    
    func turnLeft() throws {
        guard (currentStepInPath < correctPath.count) else {
            throw PugBotError.EndOfPath
        }
        let direction = correctPath[currentStepInPath]
        if direction != .Left {
            throw PugBotError.DidNotTurnLeft(directionMoved: direction)
        }
        currentStepInPath++
    }
    func turnRight() throws {
        guard (currentStepInPath < correctPath.count) else {
            throw PugBotError.EndOfPath
        }
        let direction = correctPath[currentStepInPath]
    if direction != .Right {
    throw PugBotError.DidNotTurnRight(directionMoved: direction)
    }
    currentStepInPath++
}
func moveForward() throws {
    guard (currentStepInPath < correctPath.count) else {
        throw PugBotError.EndOfPath
    }
    let direction = correctPath[currentStepInPath]
    if direction != .Forward {
        throw PugBotError.DidNotGoForward(directionMoved: direction)
    }
    currentStepInPath++
}
    func goHome() throws {
        try moveForward()
        try turnLeft()
        try moveForward()
        try turnRight()
    }
    func movePugBotSafely(move:() throws -> ()) -> String {
        do {
            try move()
            return "Completed move successfully."
        } catch PugBotError.DidNotTurnLeft(let directionMoved) {
            return "The PugBot was supposed to turn left, but turned \(directionMoved) instead."
        } catch PugBotError.DidNotTurnRight(let directionMoved) {
            return "The PugBot was supposed to turn right, but turned \(directionMoved) instead."
        } catch PugBotError.DidNotGoForward(let directionMoved) {
            return "The PugBot was supposed to move forward, but turned \(directionMoved) instead."
        } catch PugBotError.EndOfPath() {
            return "The PugBot tried to move past the end of the path."
        } catch {
            return "An unknown error occurred"
            //Unfortunately, at this point, Swift's Do-Try-Catch system isn't type-specific. There's no way to tell the compiler that it should only expect PugBotErrors. To the compiler, that isn't exhaustive, because it doesn't handle each and every possible error that it knows about, so you still need to have a default case even though the method will never call it.
        }
    }
    
}

let rightDirections: [Direction] =
[.Forward, .Left, .Forward, .Right]
let wrongDirections: [Direction] =
[.Left, .Left, .Left, .Forward]
let invalidPug = PugBot(name: "Lassie", correctPath: rightDirections)
let myPugBot = PugBot(name: "Delia", correctPath: rightDirections)!
let wrongPugBot = PugBot(name: "Delia", correctPath: wrongDirections)!

/*movePugBotSafely {
    try myPugBot.goHome()
    try myPugBot.moveForward()
}*/







