//: Playground - noun: a place where people can play

import UIKit

var myFavoriteSong: String?
myFavoriteSong = "Vologda"
myFavoriteSong = nil

 let ageInteger: Int? = 30
print(ageInteger)

var authorName: String? = "Matt Galloway"
/*print("Author is \(unwrappedAuthorName)") now it makes error because authorName is optional*/
 var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")
//it's force unwrapping of optional

if authorName != nil {
    var unwrappedAuthorName = authorName!
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}
//The code is now safe, but it's still not perfect. If you rely on this technique, you'll have to remember to check for nil every time you want to unwrap an optional.

if let unwrappedAuthorName: String = authorName {
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}
//it's if let binding method to unwrap an optional

if let unwrappedAuthorName = authorName {
    print("Author is \(unwrappedAuthorName)")
} else {
    print("No author.")
}
//Normally you wouldn't specify the type of the unwrapped variable in an if let statement

let authorName1: String? = "Matt Galloway"
let authorAge: Int? = 30
if let name: String = authorName1,
    age: Int = authorAge {
        print("The author is \(name) who is \(age) years old.")
} else {
    print("No author or no age.")
}
//This code unwraps two values. It will only execute the if part of the statement when both optionals contain a value.

myFavoriteSong = "Vologda"
if let Song: String = myFavoriteSong {
    print(Song)
} else {
    print("I don’t have a favorite song.")}

 var optionalInt: Int? = 10
var result: Int = optionalInt ?? 0
//This is a nil coalescing which is the third way to unwrap an optional and happens on the second line, with the double question mark (??). This line means result will equal either the value inside optionalInt, or 0 if optionalInt contains nil.

func divideIfWhole(a: Int, _ b: Int) -> Int? {
    if a % b == 0 {
        return a / b
    } else {
      return nil
    }
}
var a = 10
var b = 2
if let result = divideIfWhole(a, b) {
    print("Yep, it divides \(result) times")
} else {
    print("Notdivisible:[.")
}

result = divideIfWhole(a, b) ?? 0




