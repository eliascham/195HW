//
//  DetailViewController.swift
//  app5
//
//  Created by Elias Chamariq on 12/21/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import Foundation

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var des: UITextView!
    
    var park: Park? = nil
    var data : [String : Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let currPark = data as [String : Any]? {
            name.text = currPark["name"] as! String
            designation.text = currPark["designation"] as! String
            if currPark["image"] as! String != ""{
                let url = URL(string: currPark["image"] as! String)
                image.kf.setImage(with: url)
            }
            des.text = currPark["description"] as! String
        }
    }
    
    
    
}
