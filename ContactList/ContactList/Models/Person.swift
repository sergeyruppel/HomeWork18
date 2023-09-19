//
//  Person.swift
//  ContactList
//
//  Created by Sergey Ruppel on 18.09.2023.
//

import Foundation

struct Person {
    
    let firstName: String
    let lastName: String
    let phoneNumber: Int
    let email: String
    
    static func getPersons() -> [Person] {
        var persons: [Person] = []
        
        let firstNames = Data.firstNames.shuffled()
        let lastNames = Data.lastNames.shuffled()
        
        for item in 0..<firstNames.count {
            let person = Person(firstName: firstNames[item],
                                lastName: lastNames[item],
                                phoneNumber: Int.random(in: 7900000000...7999999999),
                                email: "\(firstNames[item]).\(lastNames[item])@gmail.com".lowercased())
            persons.append(person)
        }
        
        return persons
    }
}
