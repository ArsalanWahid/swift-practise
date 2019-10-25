//: Playground - noun: a place where people can play

import Foundation


//Substring - Do later
let email = "lalazar@gmail.com"

for n in email{
    if n == "@"{
        let index = email.index(of: n)
        let substring = email[..<index!]
        print(String(substring))
    }
}




// Unicode Practise
let man = "man"

//UTF string representation
for characters in man.utf8{
    print(characters)
}

//UTF-16 string representation
for characters in man.utf16{
    print(characters)
}

//UTF 32 string representation only in swift 4.2


//Unicode scalara values from a stringg in decmal notation

for characters in man.unicodeScalars{
    print(characters.value)
}
