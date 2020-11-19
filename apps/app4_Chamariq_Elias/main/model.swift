//
//  model.swift
//  app4_Elias_Chamariq
//
//  Created by Elias Chamariq on 11/19/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import UIKit

struct Contact {
    var first: String
    var last: String
    var company: String
    var email: String
    var phone: String
    var photo: UIImage?
    
    init(_ first: String, _ last: String, _ company: String,
         _ email: String, _ phone: String, _ photo: UIImage?) {
        self.first = first
        self.last = last
        self.company = company
        self.email = email
        self.phone = phone
        self.photo = photo
    }
    
    init() {
        self.first = ""
        self.last = ""
        self.company = ""
        self.email = ""
        self.phone = ""
        self.photo = nil
    }
}
