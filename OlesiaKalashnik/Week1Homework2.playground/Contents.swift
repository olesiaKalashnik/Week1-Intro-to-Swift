// Homework for class #2 week 1

import UIKit

//TASK1: Write a function that takes in an array of strings, checks if array contains “Earth”, if not, adds it otherwise returns
var array = ["Mars", "Jupiter", "Venus"]
func insureEarthIsPresent(inout arr: [String]) {
    if arr.contains("Earth") {
        return
    } else {
        arr.append("Earth")
    }
}


//TASK2: Use reduce to create single string from the above array. [“Venus”, “Earth”] would produce “Venus, Earth”
func reduceToOneString(arr:[String]) -> String {
    return arr.reduce("") { (acc, element) -> String in
        return acc + " " + element
    }
}


//TASK3: Declare and implement a dictionary that can contain as values Strings, Ints, etc
var genericValuesDictionary = [NSObject:Any]()


//TASK4: Declare a dictionary of string values. Declare a function that takes in a string and searches dictionary for it. Use filter
var dict = [NSObject:String]()
func dictionaryContainsValue(val : String) -> Bool {
    let filteredDict = dict.filter { (pair: (key: Any, value: String)) -> Bool in
        pair.value == val
    }
    return !filteredDict.isEmpty
}


//TASK5: Write examples for union, intersect, subtract, exclusive Or set operations
let zoo1 : Set = ["Bear", "Monkey", "Kangaroo", "Honey badger"]
let zoo2 : Set = ["Koala", "Hippopotamus", "Monkey", "Tiger", "Guinea pig"]
let animalsInBothZoos = zoo1.union(zoo2)
let commonAnimals = zoo1.intersect(zoo2)
let animalsInZoo1Only = zoo1.subtract(zoo2)
let animalsInZoo2Only = zoo2.subtract(zoo1)
let animalsInEitherZoo1OrZoo2 = zoo1.exclusiveOr(zoo2)


//TASK6: Write a function that counts repeating words and prints out the count of each
func printRepeatingWordsWithCountUsingHigherOrderFunctions(arr:[String]) {
    let arraysOfRepeatingWords = Set(arr).map { (element) -> [String] in
        arr.filter {$0 == element}
    }
    for array in arraysOfRepeatingWords {
        print("Array contains \(array.count) elements with value '\(array.first!)'")
    }
}

func printRepeatingWordsWithCountUsingDictionary(arr:[String]) {
    let dict = makeDictionary(arr)
    for (key, value) in dict {
        print("Array contains \(value) elements with value '\(key)'")
    }
}

func makeDictionary(array: [String]) -> [String:Int] {
    var dictionary = [String:Int]()
    for el in array {
        dictionary[el] = dictionary[el]==nil ? 1 : (dictionary[el]!+1)
    }
    return dictionary
}


//TASK7: Add two numbers without using “+”
func addTwoNumbersPositive(num1: Int, num2: Int) -> Int {
    var answer = [num1, num2].maxElement()!
    let lesserNum = [num1, num2].minElement()!
    for _ in 0..<lesserNum {
        answer += 1
    }
    return answer
}

func addTwoNumbersPositiveAndNegative(num1: Int, num2: Int) -> Int {
    var loops = [abs(num1), abs(num2)].minElement()!
    //if abs(num1) != abs(num2)
    let answerIfNumsAbsNotEqual = [num1, num2].filter({abs($0) != loops}).first
    if let maxEl = answerIfNumsAbsNotEqual {
        let maxIsPositive = (maxEl == abs(num1)) ? (num1 > 0) : num2 > 0
        let minIsPositive = (loops == abs(num1)) ? (num1 > 0) : num2 > 0
        return addWhenNotEqual(loops, acc: maxEl, maxIsPositive: minIsPositive, minIsPositive: maxIsPositive)
        
        //if abs(num1) == abs(num2)
    } else {
        loops = abs(num1)
        let minIsPositive = num1 > 0
        let maxIsPositive = num2 > 0

        return addWhenEqual(loops, acc: num2, maxIsPositive: maxIsPositive, minIsPositive: minIsPositive)
    }
}

//helper functions
func addWhenEqual(loops: Int, acc: Int, maxIsPositive: Bool, minIsPositive: Bool) -> Int {
    var localAcc = acc
    for _ in 0..<loops {
        print(localAcc)
        localAcc = (maxIsPositive && minIsPositive) || (!maxIsPositive && minIsPositive) ? (localAcc + 1) : (localAcc - 1)
        print(localAcc)
    }
    return localAcc
}

func addWhenNotEqual(loops: Int, acc: Int, maxIsPositive: Bool, minIsPositive: Bool) -> Int {
    var localAcc = acc
    for _ in 0..<loops {
        print(localAcc)
        localAcc = (maxIsPositive && minIsPositive) || (maxIsPositive && !minIsPositive) ? (localAcc + 1) : (localAcc - 1)
        print(localAcc)
    }
    return localAcc
}
