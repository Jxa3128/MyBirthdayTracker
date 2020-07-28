//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by Jorge Juarez on 7/26/20.
//  Copyright © 2020 Jorge Inc. All rights reserved.
//

import UIKit

//adding the protocol
protocol AddBirthdayViewControllerDelegate{
    func addBirthdayViewController(_ addBirthdayViewController: AddBirthdayViewController, didAddBirthday birthday: Birthday)

}
class AddBirthdayViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    
    var delegate: AddBirthdayViewControllerDelegate?

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
        
        //passing the delegate to birthday class
        delegate?.addBirthdayViewController(self, didAddBirthday: newBirthday)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelTapped(_sender: UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }
    
}


