//: Playground - noun: a place where people can play

import UIKit

let numbers: Array<Int>
let inferredNumbers = Array<Int>()
let alsoInferredNumbers = [Int]()
let array3: [String] = []
var array2 = []
array2 = ["ds", 1, 15]
//создан массив типа AnyObject. Но его нельзя увеличить или изменить is get only
array2[0]
array2[1]

let evenNumbers = [2, 4, 6, 8]
 let allZeros = [Int](count: 5, repeatedValue: 0)
//array literals
var array5 = [1, 2, 3]
array5[0...1] = [4, 5]
print(array5)
array5[2] = 1
//Но фразу array5[3] = 10 написать нельзя, потому что такой элемент еще не создан. Только после того, как его создать операцией array5.append(22), например, можно и переназначать его значения: array5[3] = 20
array5.append(22)
array5[3] = 20
array5

var players = ["Alice", "Bob", "Cindy", "Dan"]
 print(players.isEmpty)

if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let's start!")
}

var currentPlayer = players.first
print(players.first)
 print(players.last)

currentPlayer = players.minElement()
print(currentPlayer)
//min element means which has min value in alphabatical sense
if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
}

 var player = players[0]
let upcomingPlayers = players[1...2]
print(upcomingPlayers)
//the constant upcomingPlayers is actually an array of the same type as the original array. 1...2 is named a range.

func isPlayerEliminated(playerName: String) -> Bool {
    if players.contains(playerName) {
        return false
    } else {
        return true
    } }
 print(isPlayerEliminated("Bob"))

 players[1...3].contains("Bob")
//contains - property, которое ищет элемент с заданным именем в массиве и даже в диапазоне (range)

players.append("Eli")
players += ["Gina"]
players.insert("Frank", atIndex: 5)
//Frank имеет индекс 5

var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed")
players
//This method does two things: It removes the last element and then it returns this element

removedPlayer = players.removeAtIndex(2)
print("\(removedPlayer) was removed")
players

players.indexOf("Dan")

players[4] = "Franklin"
players

players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players)
//This code replaces the first two players, Alice and Bob, with the four players in the new players array. As you can see, the size of the range doesn't have to be equal to the size of the array that holds the values you're adding.
let playerAnna = players.removeAtIndex(3)
players.insert(playerAnna, atIndex: 0)
print(players)

players = players.sort()
print(players)

var scores = [2, 2, 8, 6, 1, 2]

for playerName in players {
    print(playerName)
}

for (index, playerName) in players.enumerate() {
    print("\(index + 1). \(playerName)")
}

func sumOfAllItems(intArray: [Int]) -> Int {
    var sum = 0
    for number in intArray {
        sum += number
    }
    return sum
}
print(sumOfAllItems(scores))


print(scores)
print(players)
scores.append(3)
for (index, playerName) in players.enumerate() {
    print(players[index], scores[index])
}

//Sequence operations:
let sum = scores.reduce(0, combine: +)
//сложение всех scores[i]
print(sum)
let multiplication = scores.reduce(1, combine: *)
//произведение всех scores[i]
let sum1 = scores[0...2].reduce(1, combine: +)
let division = scores[0...1].reduce(1000, combine: /)
let stringSum = players.reduce("", combine: +)

 print(scores.filter({ $0 > 5 }))
//возвращает массив, все члены которого выбраны из scores и больше 5

print(scores)
// > [2, 2, 8, 6, 1, 2]
let newScores = scores.map({ $0 * 2 })
print(newScores)
// > [4, 4, 16, 12, 2, 4]
//иными словами меняет (производит отображение данного множества в новое) элементы массива по определенному закону

// let allZeros = [Int](count: 5, repeatedValue: 0)
var fromArrayOut = [Int](count: 5, repeatedValue: 2)
var itemToRemoveOut = 2

func removeOnce(itemToRemove: Int, fromArray: [Int]) -> [Int] {
    var result = fromArray
    for (index, value) in fromArray.enumerate() {
        if value == itemToRemove {
            result.removeAtIndex(index)
            break
        }
    }
    return result
}
removeOnce(itemToRemoveOut, fromArray: fromArrayOut)
fromArrayOut.append(3)
func remove2(itemToRemove: Int, fromArray: [Int]) -> [Int] {
    return fromArray.filter({$0 != itemToRemove})
}
remove2(itemToRemoveOut, fromArray: fromArrayOut)

func reverse(array: [Int]) -> [Int] {
var result = [Int]()
    let number = array.count - 1
    for ( index) in array.enumerate() {
        //result[index.index] = array[number - index.index]
        //так не работает, может быть, потому что связывает ссылкой на два массива
        result.append(array[number - index.index])
    }
    return result
}

var array = [2,3,5,9,10]
reverse(array)

func reverse1(array: [Int]) -> [Int] {
    var newArray = [Int]()
    for item in array {
        newArray.insert(item, atIndex: 0)
    }
    return newArray
}
reverse1(array)


func randomFromZeroTo(number: Int) -> Int {
    return Int(arc4random_uniform(UInt32(number)))
}

func randomArray(array: [Int]) -> [Int] {
    var result = [Int] ()
    var arrayRemainder = array
    let number = array.count
    for item in 1...number {
        let casualIndex = randomFromZeroTo(number - item + 1)
        result.insert(arrayRemainder[casualIndex], atIndex: 0)
        arrayRemainder.removeAtIndex(casualIndex)
    }
    
    return result
}
array
randomArray(array)
randomArray(array)
randomArray(array)
randomArray(array)
randomArray(array)


func randomArray1(array: [Int]) -> [Int] {
    var newArray = array
    for index in 0..<array.count {
        let randomIndex = randomFromZeroTo(array.count)
        let value = newArray[randomIndex]
        newArray[randomIndex] = newArray[index]
        newArray[index] = value
    }
    return newArray
}
randomArray1(array)
randomArray1(array)
randomArray1(array)




var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
//Creating an Array with a Default Value
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
// anotherThreeDoubles is of type [Double], which is competable with threeDoubles and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles

let arr = ["a","b","c"]

let indexOfA = arr.indexOf("a") // 0
let indexOfB = arr.indexOf("b") // 1
let indexOfD = arr.indexOf("d") // nil

let arr1 = [10, 3,24]
let indexOf3 = arr1.indexOf(3)
let indexOf2 = arr1.indexOf(2)
