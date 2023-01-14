import UIKit

var greeting = "Hello, playground"
greeting = "ksje"
print(greeting)

var height: Double = 1.75

var lst = [height, 4.5]


var dct = Dictionary<String, String>()
dct["vaibhav", default: "hello"]

enum Activity {
    
    case Singing(topic: String)
}

let first = 2
let second = 12

if second > 10 {
    print("he;;p")
}

let myname = "va"
let frname = "vb"

if myname < frname {
    print("yaha \(myname.count)")
}

let platform = ["iOS", "MacOS", "TvOS"]

for os in 1...4 {
    print("We are using \(os)")
}
    
func rollDice () -> Int {
    return Int.random(in: 1...20)
}

print(rollDice())

func hello() -> [String] {
    return ["vaibhav", "manohar"]
}

enum ValidationError: Error {
        case outOfBound
        case notFound
    }
    

func squareRoot(of : Int) throws -> Int {
    
    if of > 1000 || of < 1 { throw ValidationError.outOfBound }
    for i in 1...100 {
        if i*i == of {
            return i
        }
    }
    throw ValidationError.notFound
    
}

do {
    print(try squareRoot(of: 144))
} catch ValidationError.outOfBound {
    print("Out of bound")
} catch ValidationError.notFound {
    print("No root")
} catch {
    print("Dont know")
}

let closer = {
    (_ name: String, _ value: Int) -> String in "my name is \(name) with value \(value)"
}

print(closer("vaibhav", 5))

let stringToSort = ["vaibhav", "adi", "amit", "avi", "nalin", "ankisha"]

print(stringToSort.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "vaibhav" {return true}
    else if name2 == "vaibhav" {return false}
    return name1 < name2
}))

print(stringToSort.sorted {name1, name2 in
    if name1 == "vaibhav" {return true}
    else if name2 == "vaibhav" {return false}
    return name1 < name2
})

print(stringToSort.sorted {$0 > $1})

func randNumber () -> Int {
    Int.random(in: 1...20)
}

func makeAnArray(size: Int, using generator: () -> Int) -> [Int] {
    var array = [Int]()
    for _ in 1...size {
        let i = generator()
        array.append(i)
    }
    return array
}

print(makeAnArray(size: 10, using: randNumber))

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


for i in luckyNumbers.filter ({$0 % 2 != 0}).sorted().map( { return "\($0) is a lucky number"}) {print(i)}

//struct Car {
//    let model : String
//    let number : Int
//    var gear
//}

class Car {
    var gear = 0 {
        didSet{
            print("Gear is at \(gear)")
        }
    }
}

let car = Car()
car.gear += 1

class User {
    var name = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.name = name
        return user
    }
}

let user1 = User()
let user2 = user1.copy()
user2.name = "Vaibhav"

print(user1.name)
print(user2.name)
