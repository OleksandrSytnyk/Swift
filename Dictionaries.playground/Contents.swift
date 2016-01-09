//: Playground - noun: a place where people can play

import UIKit


let pairs: Dictionary<String, Int>
let inferredPairs = Dictionary<String, Int>()
let alsoInferredPairs = [String: Int]()

let namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)

 var emptyDictionary: [Int: Int]
emptyDictionary = [:]
//пустой словарь
print(namesAndScores["Anna"])

print(namesAndScores.isEmpty)
print(namesAndScores.count)

print(Array(namesAndScores.keys))
print(Array(namesAndScores.values))

var bobData = ["name": "Bob",
    "profession": "Card Player",
    "country": "USA"]

bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"
//updateValue(_:forKey:) replaces the value of the given key with the new value and returns the old value. If the key doesn't exist, this method will add a new pair and return nil.
bobData.removeValueForKey("state")
//This method will remove the key "state" and its associated value from the dictionary.
bobData["city"] = nil
//it's a shorter way to remove

print(bobData)

 func playerData(dictionary: [String: String]) -> [String]? {
    var result = ["", ""]
    if dictionary["name"] != "Bob" {
        return nil
    }
    if let city = dictionary["city"] {
        result[0] = city
    }
    if let country = dictionary["state"] {
        result[1] = country
    }
    return result
}
var result1 = playerData(bobData)?[0]
var result2 = playerData(bobData)?[1]
if bobData["name"] == "Bob" {
    print("city is:  \(result1)")
    print("state is:  \(result2)")
}

 bobData.updateValue("Bobby", forKey: "name")
print(bobData)

for (key, value) in namesAndScores {
    print("\(key) - \(value)")
}

for key in namesAndScores.keys {
    print("\(key), ")
}

//если же ты хочешь, печать не в столбик, а в строчку, то выбирается метод print с двумя переменными, одна из которых terminator об этом говорит
for key in namesAndScores.keys {
    print("\(key), ", terminator: "")
}
print("2") //Эта строчка обязательна, только вместо двойки пробел. Без нее следующий print будет печатать в старой строке
print("2")

let namesString = namesAndScores.reduce("",
    combine: { $0 + "\($1.0), " })
print(namesString)


 print(namesAndScores.filter({ $0.1 < 5 }))

print("some string".hashValue)
// > 4799450059642629719
print(1.hashValue)
// > 1
print(false.hashValue)
// > 0
print("".hashValue)

   func replaceValueForKey(key1: String, withValueForKey key2: String, inDictionary: [String: Int]) -> [String: Int] {
    var newDictionary = inDictionary
    let oldValue = newDictionary[key1]
    newDictionary[key1] = newDictionary[key2]
    newDictionary[key2] = oldValue
    return newDictionary
    }
let dict = ["NY": "New York", "CA2": "California"]
let dictNew = ["NY": "New York", "CA": "California1"]

func printLongStatesNames (dictionary: [String: String]) {
  print(dictionary.filter({ $0.1.characters.count > 8 }))
}

func printLongStateNames(dictionary: [String: String]) {
    for (_, value) in dictionary {
        if value.characters.count > 8 {
            print(value)
        }
    }
}
printLongStatesNames(dict)
printLongStateNames(dict)
//both function gave the same effect

 func combine(dict1: [String: String], with dict2: [String: String]) ->
    [String: String] {
      var result = dict2
        for (key, value) in dict1 {
           if dict2[key] == nil {
        result[key] = value
            }
    }
return result}

        print(combine(dict, with: dictNew))







