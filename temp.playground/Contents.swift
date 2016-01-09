//: Playground - noun: a place where people can play

import UIKit

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}
var person1 = Person(name: "Bob")
var person0 = person1
var person2 = person1
person1.name = "Jane"
print(person1.name)
print(person2.name)
print(person0.name)

