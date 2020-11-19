//
//  CTVC.swift
//  app4_Elias_Chamariq
//
//  Created by Elias Chamariq on 11/19/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController, AddContactDelegate, UINavigationControllerDelegate {
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        contacts.append(contact)
        contacts.sort { $0.last < $1.last }
        self.tableView.reloadData()
    }
    

    var contacts = [Contact]()
    
    var me: Contact = Contact("Elias", "Chamariq", "SEAS", "elias122@seas.upenn.edu", "000-000-0000", nil)
    
    var friend: Contact = Contact("Kenza", "Chamariq", "Wharton", "test@gmail.com", "000-000-0000", nil)
    
    var contact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contacts.append(me)
        contacts.append(friend)
        navigationItem.title = "Contacts"
    }
    

    

    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "addContact", sender: sender)
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Top", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel {
            let first = contacts[indexPath.row].first
            let last = contacts[indexPath.row].last
            label.text = "\(first) \(last)"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details" {
            let dest: DetailViewController = segue.destination as! DetailViewController
            dest.contact = contact
        }
        
        if segue.identifier == "addContact" {
            let dest: UINavigationController = segue.destination as! UINavigationController
            dest.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        contact = contacts[indexPath.row]
        performSegue(withIdentifier: "Details", sender: tableView)
    }
    

}
