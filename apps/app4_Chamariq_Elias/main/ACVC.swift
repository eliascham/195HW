//
//  ACVC.swift
//  app4_Elias_Chamariq
//
//  Created by Elias Chamariq on 11/19/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import Foundation
import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class AddContactViewController: UIViewController {
    
    weak var delegate: AddContactDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Add Contact"
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        var contact: Contact? = nil
        if createNewContact() != nil {
            contact = createNewContact()
            self.delegate?.didCreate(contact!)
        }
        dump(contact)
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var FN: UITextField!
    @IBOutlet weak var LN: UITextField!
    
    @IBOutlet weak var Company: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var PN: UITextField!
    
    func createNewContact() -> Contact? {
        if (FN.text == "First Name" || LN.text == "Last Name" || Company.text == "Company" ||
            Email.text == "Email" || PN.text == "Phone Number") {
            return nil
        } else {
            return Contact(FN.text!, LN.text!, Company.text!, Email.text!, PN.text!, nil)
        }
    }
}
