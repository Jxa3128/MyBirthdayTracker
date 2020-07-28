//
//  Birthday.swift
//  BirthdayTracker
//
//  Created by Jorge Juarez on 7/27/20.
//  Copyright © 2020 Jorge Inc. All rights reserved.
//

import Foundation

class Birthday {
    let firstName: String
    let lastName: String
    let birthdate: Date
    
    init(firstName: String, lastName:String, birthdate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
    }
}
