//: Playground - noun: a place where people can play

import UIKit

struct Grade {
    let letter: String
    let points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
        //There's a special method on classes in Swift that runs when an object's reference count reaches 0, but before Swift removes the object from memory. What you do in an deinitializer is up to you. Often you'll use it to clean up other resources, save state to a disk, or execute any other logic you might want when an object goes out of scope.
    }
}
// Reference count == 1
var john9 = Person(firstName: "Johnny", lastName: "Appleseed")
// Reference count == 2
var anotherJohn: Person? = john9
anotherJohn = nil
print(john9.firstName)//т.е. если ты делаешь равными две переменные ссылочного типа, одна из которых optional а другая нет, то после того, как одна стала nil, то другая осталась той же, что и была
anotherJohn = Person(firstName: "Hilary", lastName: "Clinton")
print("\(john9.firstName)!!!")//т.е. после того, как одна переменная стала nil они уже расстались навеки
// Reference count 6 (john, anotherJohn, 4 references)
var lotsaJohns = [john9, john9, anotherJohn, john9]
print(lotsaJohns[0]?.firstName)
//если в массиве хоть один член optional, то и весь массив optional
anotherJohn = nil
print(lotsaJohns[0]?.firstName)
//т.е. если в optional массиве одна переменная становится равной nil, то весь массив не становится равным nil, а сохраняет для других членов прежние значения
var person1 = Person(firstName: "Bob", lastName: "Clinton")
var person0 = person1
var person2 = person1
person1.firstName = "Jane"
print(person1.firstName)
print(person2.firstName)
print(person0.firstName)


class Student: Person {
    var grades: [Grade] = []
    override required init(firstName: String, lastName: String) {
        grades = []
        super.init(firstName: firstName, lastName: lastName)
    }
//The keyword "required" will force all subclasses of Student to not only implement this initializer, but also use this initializer when they make their calls to super.init.
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    }
    //The compiler forces a convenience initializer to call a required initializer, instead of handling the initialization of stored properties itself.You might want to mark an initializer as convenience if you only use that initializer as an easy way to initialize an object, but you still want it to leverage one of your required initializers.
    func recordGrade(grade: Grade) {
        grades.append(grade)
    }
}
 let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")



func phonebookName(person: Person) -> String {
    return "\(person.lastName), \(person.firstName)"
}
let person = Person(firstName: "Johnny", lastName: "Appleseed")
let student = Student(firstName: "Jane", lastName: "Appleseed")
print( phonebookName(person) ) // Appleseed, John
print( phonebookName(student) ) // Appleseed, Jane
//polymorphism is a programming languages ability to treat an object differently based on context using the same functions of base class. These functions have no idea that the object passed in is anything other than a regular base class object. It can only observe the elements of Student that are defined in the Person base class.

class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    var sports: [String]
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        super.init(firstName: firstName, lastName: lastName)
        recordGrade(passGrade)
    }

    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    override func recordGrade(grade: Grade) {
        super.recordGrade(grade)
        //The super keyword is similar to self, except it will invoke the method in the nearest implementing superclass. While it's not a hard rule, it's generally best practice to call the super version of a method first when overriding. That way, the superclass won’t experience any side effects introduced by its subclass, and the subclass won't need to know the superclass's implementation details.
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    func athleteIsEligible() -> Bool {
        return failedClasses.count < 3
    }
}

/*final class Student: Person {
//...
}
// Build error!
class StudentAthlete: Student {
//...
}
By marking the Student class final, you tell the compiler to prevent any classes from inheriting from Student.
class Student: Person {
final func recordGrade(grade: Grade) {
//...
} }
class StudentAthlete: Student {
// Build error!
override func recordGrade(grade: Grade) {
//...
} }
Additionally, you can mark individual methods as final, if you want to allow a class to have subclasses, but protect individual methods from being overridden
*/

 class Student1 {
    var firstName: String
    var lastName: String
    var grades: [Grade]
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        grades = [] }
    init(transfer: Student1) {
        self.firstName = transfer.firstName
        self.lastName = transfer.lastName
        grades = []
        //In this example, the Student class can be built with another Student object.
    }
}

class StudentAthlete1: Student1 {
    var sports: [String]
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    }
    init(transfer: Student1, sports: [String]) {
        self.sports = sports
        super.init(transfer: transfer)
    }
}

class Team {
    var players: [Student]
    init(players: [Student]) {
        self.players = players
    }
    func teamEligable() -> Bool {
        for player in players {
        if player is StudentAthlete {
        }else{ return false}
        }
        return true
    }
}
//Type constraints. Здесь выбираются элементы по принадлежности к классу, который мы сами создали - ограничения, накладываемые типом. Кроме того - это пример того, как обойти невозможность сказать не принадлежит классу. Достаточно в операторе условия пропустить действие в случае выполнения условия и включить это действие, когда условие не выполняется.

class Student2: Person {
    var partner: Student2?
    deinit {
        print("\(firstName) being deallocated!")
    }
}
var john2: Student2? = Student2(firstName: "Johnny2", lastName: "Appleseed")
var jane2: Student2? = Student2(firstName: "Jane2", lastName: "Appleseed")
john2?.partner = john2
jane2?.partner = jane2
john2 = nil
jane2 = nil

class Student3: Person {
    weak var partner: Student3?
    deinit {
        print("\(firstName) being deallocated!")
    }
}
var john3: Student3? = Student3(firstName: "Johnny3", lastName: "Appleseed")
var jane3: Student3? = Student3(firstName: "Jane3", lastName: "Appleseed")
john3?.partner = john3
jane3?.partner = jane3
john3 = nil
jane3 = nil

//Create 3 simple classes called A, B, and C where C inherits from B and B inherits from A. In each class initializer, call print("I'm A!") in each respective classes initializer both before and after super.init().

class A {
    init() {
       print("I'm A!")
    }
}

class B: A {
    override init() {
        print("I'm B!")
        super.init()
        print("I'm B!")
    }
}

class C: B {
    override init() {
    print("I'm C!")
    super.init()
    print("I'm C!")
    }
}

C()

    //Create a subclass of StudentAthlete called StudentBaseballPlayer and include properties for position, number, and battingAverage.• What are the benefits and drawbacks of subclassing StudentAthlete in this scenario?• Can you think of an alternative to sublcassing? Assume you could modify any class in the hierarchy.

class StudentBaseballPlayer: StudentAthlete {
    var position: String  = ""
    var number: Int
    var battingAverage: Double
    
    init(firstName: String, lastName: String, number: Int, battingAverage: Double) {
        self.number = number
        self.battingAverage = battingAverage
        super.init(firstName: firstName, lastName: lastName)
    }

    required init(firstName: String, lastName: String) {
        self.number = 5
        self.battingAverage = 0.0
        super.init(firstName: firstName, lastName: lastName)
        /*self.number = 5
        self.battingAverage = 0.0*/
        //если написать это до super.init, то компилятор выдаст ошибку
    }
    }





