//
//  DataManager.swift
//  ContactList
//
//  Created by Sergey Ruppel on 25.09.2023.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    private init() {}
    
    var persons = Person.getPersons()
 
}
