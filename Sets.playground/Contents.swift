//: Playground - noun: a place where people can play

import UIKit

let setOne: Set<Int>
let setTwo = Set<Int>()
print(setTwo)

let someSet: Set<Int> = [1, 2, 3, 1]
print(someSet)
let anotherSet: Set = [1, 2, 3, 1]
//although you created the set with two instances of the value 1, that value only appears once—remember, a set's values must be unique.

print(someSet.isEmpty)
print(someSet.count)
print(someSet.contains(1))
print(someSet.contains(4))
// the check for the existence of a specific element

 print(someSet.first)
//this property return one of the elements in the set. However, because sets are unordered, you can't know exactly which item you'll get.

var myTimes: Set = ["8am", "9am", "10am"]
myTimes.insert("11am")
let removedElement = myTimes.remove("8am")
print(myTimes)
myTimes.remove("12pm")
print(myTimes)

for element in myTimes {
    print(element)
}

func extraDeleting(array: [String]) -> [String] {
    var set: Set = Set(array)
    var newArray = Array(set)
    return newArray
}
let array = ["1","1","2","2","3","3","3"]
extraDeleting(array)


let adamTimes: Set = ["9am", "11am", "1pm"]
let unionSet = myTimes.union(adamTimes)
print(unionSet)
//объединение - union

let intersectSet = myTimes.intersect(adamTimes)
print(intersectSet)
//пересечение - intersect

let subtractSet = myTimes.subtract(adamTimes)
print(subtractSet)
//оставляет в myTimes только то, чего нет в adamTimes

let exclusiveOrSet = myTimes.exclusiveOr(adamTimes)
print(exclusiveOrSet)
let exclusiveOrSet2 = adamTimes.exclusiveOr(myTimes)
print(exclusiveOrSet2)
//оставляет только то, что есть в первом set и нет во втором, и наоборот, т.е. порядок не важен

let emails: Set = ["aa", "bbb", "ccc", "dd", "ee"]

let email = "aa"

func containEmail(email: String, _ set: Set<String>) -> Bool {
    var result = false
    if set.contains(email) {
        result = true
    }
    return result
}

containEmail(email, emails)

let day1: Set = ["Anna", "Benny", "Charlie"]
let day2: Set = ["Anna", "Benny", "Danny"]
let day3: Set = ["Anna", "Danny", "Eric"]

func goodStudents(day1: Set<String>, day2: Set<String>, day3: Set<String>) -> Set<String> {
    return day1.intersect(day2.intersect(day3))
}
goodStudents(day1, day2: day2, day3: day3)


 func firstDayOnly(day1: Set<String>, _ day2: Set<String>, _ day3: Set<String>) -> Set<String> {
   // return day1.subtract(day2.union(day3))
   return day1.subtract(day2).subtract(day3)

}
firstDayOnly(day1, day2, day3)


