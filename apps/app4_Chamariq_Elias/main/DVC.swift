//
//  DVC.swift
//  app4_Elias_Chamariq
//
//  Created by Elias Chamariq on 11/19/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    var contact = Contact()
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        first.text = contact.first
        last.text = contact.last
        company.text = contact.company
        email.text = contact.email
        phone.text = contact.phone
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
