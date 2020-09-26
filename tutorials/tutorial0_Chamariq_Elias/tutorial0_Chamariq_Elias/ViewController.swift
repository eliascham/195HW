//
//  ViewController.swift
//  tutorial0_Chamariq_Elias
//
//  Created by Elias Chamariq on 9/10/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Blue"
        label.textColor = .systemBlue
    }

    @IBOutlet weak var butt: UIButton!
    
    @IBAction func ChangeText(_ sender: Any) {
        if (count%2 == 0) {
            label.text = "Red"
            label.textColor = .systemRed
            butt.setTitle("Turn Blue", for: .normal)
            count += 1
        } else {
            label.text = "Blue"
            label.textColor = .systemBlue
            butt.setTitle("Turn Red", for: .normal)
            count += 1
        }
    }
    
}

