//: Playground - noun: a place where people can play

import UIKit

enum Direction {
    case Left
    case Right }

protocol Vehicle {
    var weight: Int { get }
    var name: String { get set }
    //When defining properties in a protocol, you must explicitly mark them as get and/or set, somewhat similar to the way you declare computed properties. However, much like methods, you don't include any implementation for properties.
    func accelerate()
    func stop()
    func turn(direction: Direction)
    //methods defined in protocols can't contain default parameters - you can't write: Direction = .Left, for example
    func turn()
    //second version of the method. It's needed to make parameters optionals
    func description() -> String
}
// 1-й способ организации: все включено в один протокол


protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}
//protocol's inheritance
let bike: WheeledVehicle
// 2-Й способ организации: наследование одного протокола другим

protocol WheeledVehicle1 {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}
class Bike: WheeledVehicle1 {
    //var numberOfWheels = 2  можно так
    var numberOfWheels: Int {
        return 2 }// или так
    //both are an implicit get
    private var myWheelSize: Double = 16.0
    var wheelSize: Double {
        get {
            return myWheelSize
        }
        set {
            myWheelSize = newValue
        }
    } }
//Реализация классом протокола

class Bike1: WheeledVehicle1 {
    let numberOfWheels = 2
    //you can but havn't to assign numberOfWheels as var though the protocol demand let
    var wheelSize = 16.0
    //you can't assign wheelSize as let because it has to have set
}
//Swift doesn't require you to use computed properties to implement protocols. As long as you define a property that can be read if it is defined with a get, and assigned if it's defined with a set, then that property will satisfy the protocol.
let bike1: Bike1 = Bike1()
bike1.wheelSize = 20
bike1.wheelSize

var bike2: WheeledVehicle1
bike2 = Bike1()
bike2.wheelSize
bike2 = bike1

var bike3: WheeledVehicle1 = bike1
bike3.wheelSize

protocol WeightCalculatable {
    typealias WeightType
    func calculateWeight() -> WeightType
}

class HeavyThing: WeightCalculatable {
    // This heavy thing only needs integer accuracy
    typealias WeightType = Int
    func calculateWeight() -> Int {
        return 100 }
}
class LightThing: WeightCalculatable {
    // This light thing needs decimal places
    typealias WeightType = Double
    func calculateWeight() -> Double {
        return 0.0025
    }
}
//Фактически, typealias вводят обобщение обычного протокола, позволяющее называть одним именем классы, которые используют разные типы, но схожим образом
//let b: WeightCalculatable it's a mistake because of tepealias in WeightCalculatable's body. Protocol 'WeightCalculatable' can only be used as a generic constraint because it has Self or associated type requirements
//3-й способ организации: реализация класса протокола обобщенного вида

protocol Wheeled {
    var numberOfWheels: Int { get }
}

protocol Vehicle1 {
    
}


protocol WheeledVehicle3: Vehicle1, Wheeled {
    // Implement both Vehicle1 and Wheeled. WheeledVehicle is a Wheeled, and a Vehicle1! You can use here as many protocols as you want
}
class Bike5: WheeledVehicle3 {
    // Implement both Vehicle1 and Wheeled
    var numberOfWheels = 4
}
let bike5: Bike5 = Bike5()
// is-a Wheeled
let wheeledBike: Wheeled = bike5
// is-a Vehicle
let vehicleBike: Vehicle1 = bike5
// is-a WheeledVehicle
let wheeledVehicleBike: WheeledVehicle3 = bike5
//Дополнение ко 2-му соособу организации: реализации классом не одного, а нескольких протоколов

class Bike6 { }
extension Bike6: Wheeled {
    var numberOfWheels: Int {
        return 2 }
}
extension Bike6: Vehicle1 {
    func accelerate() {
        // Accelerate
    }
    func stop() {
        // Stop
    }
}
//4-й способ организации: расширения класса через реализацию протокола. Но, реально, имеет смысл применять его либо в случае, когда нет доступа к изменению основного класса, когда это класс, заданный Swift, либо когда нужно для читабельности кода разграничить по разным расширениям разные по смыслу методы различных протоколов.  If you were to remove a protocol from Bike6, you could simply delete the extension that adopts that protocol entirely.



protocol WhatType {
    var typeName: String { get }
}
extension String: WhatType {
    var typeName: String {
        return "I'm a String" + "  " +  self
    }
}
let myType: WhatType = "Swift by Tutorials!"
myType.typeName // I'm a String


extension Int: WhatType {
    var typeName: String {
        return String(self * 100)
    }
}

let myType1: WhatType = 5
myType1.typeName
//Иными словами реализация WhatType необязательно должна быть типа String
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// prints "Three feet is 0.914399970739201 meters"
let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions({print("Hello!")})
3.repetitions {
    print("Goodbye!")
}
//trailing closure syntax


extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
//Mutating Instance Methods

extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        return (self / decimalBase) % 10
        
    }
}
123456789[1]
746381295[9] // returns 0, as if you had requested:
//Индексация. This subscript [n] returns the decimal digit n place in from the right of the number

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range1")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2


extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}
//Nested type. Вложенный тип, т.е. тип Kind вложен в тип Integer
func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            //print("- ", terminator: "")
            print("- ,")
        case .Zero:
            print("0 ", terminator: "")// терминатор показывает, что печатать далее нужно в той же строке
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
// prints "+ + - 0 - 0 +"




protocol Wheeled2 {
    var numberOfWheels: Int { get }
}
class ClassyBike: Wheeled2 {
    let numberOfWheels = 2
}
struct StructyBike: Wheeled2 {
    let numberOfWheels = 2
}
enum EnummyBike: Wheeled2 {
    case Mountain
    case Road
    case Tricycle
    var numberOfWheels: Int {
        switch self {
        case Mountain, Road:
            return 2
        case Tricycle:
            return 3 }
    } }
// Class
var wheels: Wheeled2 = ClassyBike()
wheels.numberOfWheels // 2
// Struct
wheels = StructyBike()
wheels.numberOfWheels // 2
// Enum
wheels = EnummyBike.Tricycle
wheels.numberOfWheels // 3!


class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
struct Grade {
    let letter: String
    let points: Double
    var credits: Double
}

class Student: Person{
    var studentId: Int
    
    
    override required init(firstName: String, lastName: String) {
        studentId = 1000000000
        super.init(firstName: firstName, lastName: lastName)
    }
    init(studentId: Int) {
        self.studentId = studentId
        super.init(firstName: "", lastName: "")
    }
}

class StudentAthlete: Student {
    // Eligible, sports
}
class Teacher: Person { }
class Coach: Teacher {
    let role: String = "Coach"
    func play() {
        print("Coach the game!")
    }
}
    //Because the only way both Coach and StudentAthlete can go into a collection is to use the "lowest common denominator" type, you wouldn't be able to use any properties or methods except those found in the Person type. In many cases, there may not be any common base class between two types. Especially if those types are structs or enums! Thankfully, a protocol is the perfect solution to provide type parity between Coach and StudentAthlete:
    protocol TeamMember {
        var role: String { get }
        var firstName: String { get }
        func play()
}
class Coach1: Teacher, TeamMember {
    let role: String = "Coach"
    func play() {
        print("Coach the game!")
    }
}
class StudentAthlete1: Student, TeamMember {
    let role: String = "Player"
    func play() {
        print("Play the game")
    }
}

//Since both types now share a common (sports related!) protocol, you can add them to your collection of team members:
let roster: [TeamMember] = [
    Coach1(firstName: "Steve", lastName: "Cook"),
    StudentAthlete1(firstName: "Jane", lastName: "Appleseed"),
    StudentAthlete1(firstName: "Johnny", lastName: "Appleseed")
]
func printRoster(roster: [TeamMember]) {
    for member in roster {
        print("\(member.firstName): \(member.role)")
    }
}
printRoster(roster)





struct Record {
    var wins: Int
    var losses: Int
}

/* protocol Equatable {
func ==(lhs: Self, rhs: Self) -> Bool}  

protocol Comparable : Equatable {
func <(lhs: Self, rhs: Self) -> Bool
func <=(lhs: Self, rhs: Self) -> Bool
func >=(lhs: Self, rhs: Self) -> Bool
func >(lhs: Self, rhs: Self) -> Bool
}

These are protocols in the standard library*/

extension Record: Equatable {}
func ==(lhs: Record, rhs: Record) -> Bool {
    return lhs.wins == rhs.wins && lhs.losses == rhs.losses
}
let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)
recordA == recordB

extension Record: Comparable {}
func <(lhs: Record, rhs: Record) -> Bool {
    let lhsPercent = Double(lhs.wins) / (Double(lhs.wins) +
        Double(lhs.losses))
    let rhsPercent = Double(rhs.wins) / (Double(rhs.wins) +
        Double(rhs.losses))
    return lhsPercent < rhsPercent
}
let team1 = Record(wins: 23, losses: 8)
let team2 = Record(wins: 23, losses: 8)
let team3 = Record(wins: 14, losses: 11)
team1 < team2 // false
team1 > team3 // true
//You only defined < but what about >? Similarly, you defined == but what about != for inequality? Swift gives you a helping hand here and automatically generates those other comparison operators. If you read the documentation for Equatable and Comparable, you'll see it tells you that only == and < are needed.
let leagueRecords = [team1, team2, team3]
leagueRecords.sort()
let max = leagueRecords.maxElement() // {wins 23, losses 8}
max?.wins
max?.losses
leagueRecords.minElement() // {wins 23, losses 8}
leagueRecords.startsWith([team1, team2]) // true
leagueRecords.contains(team1)
//Since you've given Record the ability to compare two elements, the standard library has all the information it needs to sort each element in an array! As you can see, implementing Comparable and Equatable gives you quite an arsenal of tools.



/*protocol Hashable : Equatable {
var hashValue: Int { get }
} The Hashable protocol is a requirement for any type you want to use as a key to a Dictionary or a member of a Set. This protocol provides a single unique value you can use to represent an object. A Dictionary requires keys to be unique, and you can use hashValue to determine if a key exists in the dictionary, needs to be added, or if the value exists and needs to be replaced. In a Set, you would use hashValue to ensure that the same element will only appear once, if added multiple times.*/
extension Student: Equatable {}
func ==(lhs: Student, rhs: Student) -> Bool {
    return lhs.studentId == rhs.studentId}
extension Student: Hashable {
    var hashValue: Int {
        return studentId}
}
let john = Student(firstName: "Johnny", lastName: "Appleseed")
// Dictionary
let lockerMap: [Student: String] = [john: "14B"]
// Set
let classRoster: Set<Student> = [john, john, john, john]
classRoster.count // 1

/*Swift uses structs for almost all of its core types, including Bool. In the standard library, the Bool struct conforms to BooleanType and simply returns itself for boolValue!
protocol BooleanType {
var boolValue: Bool { get }
}
The flexibility afforded by using a protocol instead of the concrete Bool type allows you to create your own type that you can use in place of a Bool:*/

extension    Record: BooleanType {
    var boolValue: Bool {
        return wins > losses
    }
}
if Record(wins: 10, losses: 5) {
    print("winning!")
} else {
    print("losing :(")
}
if Record(wins: 1, losses: 5) {
    print("winning!")
} else {
    print("losing :(")
}

let record = Record(wins: 23, losses: 8)
print(record)
//Если бы не было extension ниже, то на печать бы вывелось {wins 23, losses 8}
/*protocol CustomStringConvertible {
var description: String { get }
}
The CustomStringConvertible has only a description property, which customizes how the object is represented both within print() statements and in the debugger*/

extension Record: CustomStringConvertible {
    var description: String {
        return "\(wins) - \(losses)"
    }
}
print(record)


/*Challenge A: Bike protocols
Implement Comparable and Hashable on the Bike class. Create a Set of bikes of various wheel numbers and sizes, then sort them by their wheel size.
Note: You may simply use wheelSize to calculate hashValue. If you'd like, add another property of your choice to Bike that can make it even more unique.*/
extension Bike: Equatable {}
func ==(lhs: Bike, rhs: Bike) -> Bool {
    return lhs.wheelSize == rhs.wheelSize}
let bike6 = Bike()
bike6.wheelSize = 7
let bike7 = Bike()
bike7.wheelSize = 3
bike7 == bike6
extension Bike: Comparable {}
func <(lhs: Bike, rhs: Bike) -> Bool { return lhs.myWheelSize <  rhs.myWheelSize}
bike6 > bike7
extension Bike: Hashable {
    var hashValue: Int {
        return Int(self.wheelSize)}
}
let bikes: Set = [bike6, bike7]



/*Challenge B: Pet shop tasks
Create a collection of protocols for tasks that need doing at a pet shop. The pet shop has dogs, cats, fish and birds.
The pet shop duties can be broken down into these tasks: • All pets need to be fed.
• Pets that can fly need to be caged.
• Pets that can swim need a tank.
• Pets that walk need exercise.
Note: You may simply use wheelSize to calculate hashValue. If you'd like, add another property of your choice to Bike that can make it even more unique.
￼raywenderlich.com 256
The Swift Apprentice Chapter 19: Protocols • Tanks and cages need to occasionally be cleaned.
1. Createclassesorstructsforeachanimalandadopttheappropriateprotocols. Feel free to simply use a print() statement for the method implementations.*/
protocol Pet {
    func fed()
}
protocol Fly {
    var cage: String {get}
    func caged()
    }
protocol Swim {
    var tank: String {get}
}

protocol Exercise {
    var exercises: [Exercise] {get set}
}


struct Dog: Pet {
    func fed() {
        print("The dog is fed!")
    }
}

struct Cat: Pet {
    func fed() {
        print("The cat is fed!")
    }

}

struct Fish: Pet {
    func fed() {
        print("The fish is fed!")
    }

}

struct Bird {
    //var cage: String {get}
    func caged(){}
    func fed() {
        print("The bird is fed!")
    }

}

struct Shop {
    var cats: [Cat]
    var dogs: [Dog]
    var fish: [Fish]
    var birds: [Bird]
}
/*2. Createhomogenousarraysforanimalsthatneedtobefed,caged,cleaned, walked, and tanked. Add the appropriate animals to these arrays. The arrays
should be declared using the protocol as the element type, for example var caged: [Cageable]
3. Writealoopthatwillperformthepropertasks(suchasfeed,cage,walk)on each element of each array.*/
