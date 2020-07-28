//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by Jorge Juarez on 7/26/20.
//  Copyright © 2020 Jorge Inc. All rights reserved.
//

import UIKit

class AddBirthdayViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        birthdatePicker.maximumDate = Date()
    }
    @IBAction func saveTapped(_sender: UIBarButtonItem){
        print("The save button was tapped\n")
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        print("First name is: \(firstName) and Last name is: \(lastName).")
        let birthdate = birthdatePicker.date
        print("The birthdate is: \(birthdate)")
        
        let newBirthday = Birthday(firstName: firstName, lastName: lastName, birthdate: birthdate)
        
        print("birthdate: \(newBirthday.birthdate)")
    }
    @IBAction func cancelTapped(_sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }

}

