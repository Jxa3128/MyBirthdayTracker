//
//  BirthdaysTableViewController.swift
//  BirthdayTracker
//
//  Created by Jorge Juarez on 7/27/20.
//  Copyright © 2020 Jorge Inc. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
class BirthdaysTableViewController: UITableViewController{

    //this creates an array of Birthday classes
    var birthdays = [Birthday]()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //format the dates
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = Birthday.fetchRequest() as NSFetchRequest<Birthday>
        
        //alphabetize the birthdays
        let sortDescriptor1 = NSSortDescriptor(key: "lastname", ascending: true)
        let sortDescriptor2 = NSSortDescriptor(key: "firstname", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor1,sortDescriptor2]
        
        do{
            birthdays = try context.fetch(fetchRequest)
        } catch let error {
            print("Could not fetch because of the \(error)")
        }
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //we want to return as many as there are in the array
        return birthdays.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birthdayCellIdentifier", for: indexPath)

        //position the birthday and fill in those rows 
        let birthday = birthdays[indexPath.row]
        let firstname = birthday.firstname ?? ""
        let lastname = birthday.lastname ?? ""
        cell.textLabel?.text = firstname + " " + lastname
        
        if let date = birthday.birthdate as Date? {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if birthdays.count > indexPath.row {
            let birthday = birthdays[indexPath.row]
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            context.delete(birthday)
            birthdays.remove(at: indexPath.row)
            do {
                try context.save()
            } catch let error {
                print("Could not save\(error)")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    

}
