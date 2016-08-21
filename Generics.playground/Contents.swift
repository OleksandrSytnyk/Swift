//: Playground - noun: a place where people can play

import UIKit

func getGeneric<T>(object: T) -> T.Type {
    return T.self
}
getGeneric(0)

struct Cat {
    var name: String
}

struct Keeper0<T> {}
var aCatKeeper0 = Keeper0<Cat>()


struct Keeper1<T> {
    var name: String
}
var aCatKeeper1 = Keeper1<Cat>(name: "Jason")//here name is the property of Keeper1 but not Cat

var aCatKeeper2: Keeper1<Cat> = Keeper1(name: "Jason")//here name is the property of Keeper1 but not Cat

getGeneric(aCatKeeper2)

struct Dog {
    var name: String
}
struct Keeper<T> {
    var name: String
    var morningAnimal: T
    var afternoonAnimal: T
}

let jason = Keeper(name: "Jason",
    morningAnimal: Cat(name: "Whiskers"),
    afternoonAnimal: Cat(name: "Sleepy"))//Здесь не указывается <Cat>, потому что его может вычислить компилятор

let jason2: Keeper<Cat> = Keeper(name: "Jason",
    morningAnimal: Cat(name: "Whiskers"),
    afternoonAnimal: Cat(name: "Sleepy"))//Здесь не указывается <Cat>, потому что его может вычислить компилятор


let favoriteIntsExplicit2: Array<Int>     = [8, 9, 42]
let favoriteIntsInferred2: Array          = [8, 9, 42]//These are Ints
let favoriteFloatsInferred2: Array<Float> = [8, 9, 42]

let intNames: Dictionary<Int, String> = [42: "forty-two", 7: "seven"]//это как у всех generics

let intNames2: [Int: String] = [42: "forty-two", 7: "seven"]
let intNames3 = [42: "forty-two", 7: "seven"]// а это специальные формы для словарей только и массивов


struct Keeper3<T,U> {}
var aCatKeeper3 = Keeper3<Cat, Cat>()

func swapped<T, U>(x: T, _ y: U) -> (U, T) {
    return (y, x)
}
swapped(33, "Jay")


struct Keeper5<T> {
    var name: String
    private var cats: [Cat]
    
}

let cats0: [Cat] = []
var christine = Keeper5<Cat>(name: "Christine", cats: cats0)
christine.cats.append(Cat(name: "Whiskers"))
