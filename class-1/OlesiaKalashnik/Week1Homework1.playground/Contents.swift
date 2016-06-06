import UIKit

//Write a function that takes in a string, checks if it can be converted to a number and if possible, returns a number
func stringToInt(string: String) -> Int? {
    return Int(string)
}

func stringToIntExplicit(string: String) -> Int? {
    if let integer = Int(string) {
        return integer
    } else {
        return nil
    }
}

func stringToIntWithFormatter(string: String) -> Int? {
    return NSNumberFormatter().numberFromString(string) as? Int
}

//Write a function that takes in a tuple (code, message) and returns a string by using interpolation
func makeErrorMessage(errorTuple: (code: Int, message: String)) -> String {
    return "The status is \(errorTuple.code), \(errorTuple.message)"
}

//Write a function that takes in a string, and returns a message: “String contains n characters”
func countCharactersInString(string: String) -> String {
    return "String contains \(string.characters.count)"
}

//Write a function that takes in a string and reverses it.
func reverseStringWithStride(string: String) -> String {
    var reversedString = ""
    for index in (string.characters.count-1).stride(to: -1, by: -1) {
        reversedString.append(string[string.startIndex.advancedBy(index)])
    }
    return reversedString
}

func reverseStringWithWhile(string: String) -> String {
    var reversedString = ""
    var index = string.endIndex
    while index > string.startIndex {
        index = index.predecessor()
        reversedString.append(string[index])
    }
    return reversedString
}

func reverseStringWithArray(string: String) -> String {
    var stringAsArray = string.characters.map {$0}
    
    let stringLength = stringAsArray.count
    var indexEnd = stringLength - 1
    while indexEnd > (stringLength - 1)/2 {
        let currEndElement = stringAsArray[indexEnd]
        stringAsArray[indexEnd] = stringAsArray[(stringLength - 1) - indexEnd]
        stringAsArray[(stringLength - 1) - indexEnd] = currEndElement
        indexEnd -= 1
    }
    return String(stringAsArray)
}

//Declare a variable that’s function. Implement function to take in a string (name) and return greeting message.
let greetingMessage : (String) -> String = { (name) in return "Hello, \(name)!" }
