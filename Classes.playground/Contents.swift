//: Playground - noun: a place where people can play

import UIKit

class Person {
    private var firstName: String
    private  var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
    func nameUpdate(firstName: String, _ lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
let person10 = Person(firstName: "Charles", lastName: "Dickens")
person10.nameUpdate("Mark", "Twain")
print(person10.firstName, person10.lastName)
//Unlike a struct, a class doesn't provide initializers automatically—and that means you must provide them.

var john = Person(firstName: "John", lastName: "Appleseed")
var imposter = Person(firstName: "John", lastName: "Appleseed")
var homeOwner = john
print( john === homeOwner ) // true
print( john === imposter ) // false
print( imposter === homeOwner ) // false
homeOwner = imposter
print ( john === homeOwner ) // false
homeOwner = john
print ( john === homeOwner ) // true
//It means that reference types are equal when they have the same reference to the part of the computer memory, not when hav the same values. The === identity operator compares the memory address of two references, just as the == operator checks if two values are equal. You need this when the values of reference types data were changed.


//Write a function memberOf(person: Person, group: [Group]) -> Bool that will return true if person can be found inside group, and false if it is not.Test it by creating two arrays of five Person objects for group and using john as the person. Put john in one of the arrays, but not in the other.

func memberOf(person: Person, group: [Person]) -> Bool {
    for name in group {
        if name === person {
            return true
        }
    }
    return false
}

let person1 = Person(firstName: "John", lastName: "Appleseed")
let person2 = Person(firstName: "Bob", lastName: "Smith")
let person3 = Person(firstName: "Adam", lastName: "Bush")
let person4 = Person(firstName: "Molly", lastName: "Stone")
let person5 = Person(firstName: "Donald ", lastName: "Tramp")
let person6 = Person(firstName: "Hillary", lastName: "Clinton")
let person7 = Person(firstName: "Harrison", lastName: "Ford")
let person8 = Person(firstName: "Ronald", lastName: "Reagan")
let person9 = Person(firstName: "Barack", lastName: "Obama")
var group1 = [person1, person2, person3, person4, person5]
var group2 = [ person2, person3, person4, person5, person6]

memberOf(person1, group: group1)
memberOf(person1, group: group2)



struct Grade {
    let letter: String
    let points: Double
    var credits: Double
}
class Student {
    var firstName: String
    var lastName: String
 private var grades: [Grade] = []    //init нужен исключительно для тех properties, которые неинициированы. Здесь grades инициированы и поэтому в init методе, а значит и в параметрах вызываемого экзэмпдяра класса, их нет.
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
}
    func recordGrade(grade: Grade) {
        grades.append(grade)
    }
    
    func gpa(grades: [Grade]) -> Double {
        var sum: Double = 0
        for grade in grades {
           sum += grade.points
        }
        return sum / Double(grades.count)
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
let math = Grade(letter: "A", points: 16.0, credits: 4.0)
jane.recordGrade(history)
jane.recordGrade(math)
jane.grades.append(history) // Hey! I didn't want you to do that!

let history1 = Grade(letter: "F", points: 0.0, credits: 3.0)
jane.recordGrade(history) // Double secret probation!
jane.grades.append(history1) // Build error!

//Adding of "totalCredits += grade.credits" to body of func recordGrade results to the side effect of updating credits when calling recordGrade.


//By default structures are immutable in difference to classes which means a structure can change its properties. The course is that a structure is of value type but a class is of reference type. It means that when you change the value of a struct, instead of modifying the value, you're making a new value which store in another place of the stack. On the other hand, reference-able entity is usually mutable because it's very hard to make and manage reference graphs of entities in immutable manner with proper performance.
struct Point {
    var x = 0, y = 0
    mutating func moveToX(x: Int, andY y:Int) { //Needs to be a mutating method in order to work
        self.x = x
        self.y = y
    }
}
var p = Point(x: 1, y: 2)
p.x = 3 //Works from outside the struct!
print(p.x)
p.moveToX(5, andY: 5)


/*public publicString: String = "Everyone can see me!"
internal InternalClass {
private func sayHi() {
print("Hi!")
}
func speak() {
sayHi() }
}*/
public var publicString: String = "Everyone can see me!"
  internal class InternalClass {
private func sayHi() {
        print("Hi!")
    }
    func speak() {
        sayHi() }
}
print(publicString) // "Everyone can see me!"
let myClass = InternalClass()
myClass.sayHi() // Build error!
myClass.speak() // "Hi!"
//"Nested" declarations such as properties or methods inside of a class or struct cannot have "greater" level of access than their nested type. In other words, you could not declare speak() "public" because InternalClass has a more restrictive access control of "internal". This is because if you were never able to "see" the InternalClass type from another module, you certainly couldn't access any of its members even if they are public!
class Student1 {
    var firstName: String
    var lastName: String
    private var grades: [Grade] = []
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
var credits: Double = 0.0
func recordGrade(grade: Grade) {
    grades.append(grade)
    credits += grade.credits
}
}

let jane1 = Student1(firstName: "Jane", lastName: "Appleseed")
var history2 = Grade(letter: "B", points: 9.0, credits: 3.0)
var math1 = Grade(letter: "C", points: 16.0, credits: 2.0)
jane1.recordGrade(history2)
print(jane1.credits)
jane1.recordGrade(math1)
print( jane1.credits ) // 5.0
// The teacher made a mistake; the class has 4 credits
math1.credits = 4.0
jane1.recordGrade(math1)
print( jane1.credits ) // 9.0!


    //Create a User and a List class that uses reference semantics to help maintain lists between users.• User - Has a method addList(list:) which adds the given list to a dictionary of List objects (using the name as a key), and a getList(name:) -> List which will return the List for the provided name
//• List - Contains a name and a Set of movie titles. A printList() method will print all the movies in the list.
//• Createjaneandjohnusersandhavethemcreateandsharelists.Havebothjane and john modify the same list and call printList() from both users. Are all the changes reflected?• What happens when you implementing the same with structs. What problems do you run into?


class User {
    var listsDictionary = [String: List]()
    func addList(list: List) {
        listsDictionary[list.name] = list
    
        func getList(name: String) -> List? {
            return listsDictionary[name]
        }
    }
}

class List {
    var name: String
    var movies = Set<String>()
    init (name: String, movies: Set<String>) {
        self.name = name
        self.movies = movies
    }
    
    /*func printList() {
        print("Movie List: \(name)")
        for movie in movies {
        print(movie)}
        print("\n")
    }*/
    
    func printList() {
    
    print("Movie List: \(name)")
    for movie in movies {
    print(movie)
    }
    print("\n")
    }
    
}
let John = User()
let Jane = User()
let actionList = List(name: "Action", movies: [""])

Jane.addList(actionList)
John.addList(actionList)

Jane.listsDictionary["Action"]?.movies.insert("Rambo")
Jane.listsDictionary["Action"]?.movies.insert("Terminator")
Jane.listsDictionary["Action"]?.printList()
Jane.listsDictionary["Action"]?.printList()


/*Challenge B: T-Shirt store - class or struct?
Your challenge here is to build a set of objects to support a t-shirt store. Decide if each object should be a class or a struct, and why.

• TShirt - Represents a shirt style you want to buy. Each TShirt has a size, color, price, and an optional image on the front.
И это структура, потому что никакого реального объекта за ней не стоит, т.е. если что-то изменится в описании, то изменится содержание объекта

• User - A registered user of the t-shirt store app. A user has a name, email, and a ShoppingCart (below). Это класс, потому что даже user изменит свое имя или email, он все равно останется тем же человеком и изменения, с ним происходящие можно рассматривать как его состояния.

• Address - Represents a shipping address, containing the name, street, city, and zip code. Это структура, потому что с изменением адреса меняется и содержание того, что он обозначает. Адрес можно рассматривать как значение измеряемой величины на континууме адресов

• ShoppingCart - Holds a current order, which is composed of an array of TShirt that the User wants to buy, as well as a method to calculate the total cost. Additionally, there is an Address that represents where the order will be shipped. Это класс, потому что если уж корзина набрана, то вряд ли кто будет добавлять новые товары в старую корзину или создавать другую корзину, когда только что создал первую. Иными словами, корзина - это достаточно постоянный во времени объект*/
