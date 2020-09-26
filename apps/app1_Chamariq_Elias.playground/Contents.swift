/*
 Name: Elias Chamariq
 PennKey: Elias122
 App Number = 1
 
 I'm looking forward to designing some super cool apps!!
 */

// Exercise 1: Types, Constants, Variables, Optionals

let foo: Int = 42
var fooStr: String? = "\(foo)"

print("My number is \(fooStr!)")

if let realStr = fooStr {
    print("My number is \"\(realStr)\".")
} else {
    print("My number is nil")
}

print(fooStr ?? "No Value")


// Exercise 2: Structured Data Types
var sentenceChar: [Character] = ["c", "i", "s", "1", "9", "5", " ", "i", "s", " ", "f", "u", "n"]
var sentenceStr = String(sentenceChar)
sentenceStr.append("!")
print(sentenceStr)

var peopleDict = ["Armaan" : 20, "Kenza" : 23, "Ali" : 30]
dump(peopleDict)

var myInfo = ("Elias Chamariq", 2022)
print(myInfo)


// Exercise 3: Control Flow

for (name, age) in peopleDict {
    if age < 21 {
        print("My friend \(name) is under 21")
    } else {
        print("My friend \(name) is not under 21")
    }
}

for i in 1...10 {
    print(i)
}

for ch in sentenceChar {
    print(ch)
}


// Exercise 4: Functions

func sumAndDiff(_ a: Int, _ b: Int) -> (Int, Int) {
    return (a+b, a-b)
}
sumAndDiff(3,4)

typealias Course = String
typealias PennId = Int

func enroll(in course: Course, using id: PennId) {
    print("Enrolled \(id) in \(course)")
}

let newCourse = "Cis195"
let myPennId = 54501330
enroll(in: newCourse, using: myPennId)


// Exercise 5 and 6: Classes, Structs, and Initialization (as well as Properties)

struct Rectangle {
    var length: Int
    var width: Int
    var area: Int {
        get {
            return length * width
        }
    }
    
    var description: String? {
        didSet {
            if let desc = description {
                print("\(desc)")
            }
        }
    }
    
    init(_ length: Int, _ width: Int) {
        self.length = length
        self.width = width
    }
}

var myRect = Rectangle(2, 2)
myRect.description = "This is my rectangle"

print(myRect.area)

typealias School = String?
typealias Major = String

class Student {
    var name: String
    var school: School?
    var major: Major = "undeclared"
    
    init(name: String, school: School, major: Major) {
        self.name = name
        self.school = school
        self.major = major
    }
    
    init(name: String) {
        self.name = name
    }
}

var me = Student(name: "Elias", school: "Engineering", major: "Comp Sci")
var babyQuaker = Student(name: "Noob")
print(babyQuaker.major)
let majors = ["Wharton", "CIS", "ESE", "Bio", "MechE"]
babyQuaker.major = majors.randomElement()!
print(babyQuaker.major)
