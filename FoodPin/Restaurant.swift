//
//  Restaurant.swift
//  FoodPin
//
//  Created by Patrick White on 11/22/16.
//  Copyright © 2016 Patrick White. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var location = ""
    var type = ""
    var image = ""
    var isVisited = false
    var phone = ""
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool, phone: String) {
        self.name      = name
        self.location  = location
        self.type      = type
        self.image     = image
        self.isVisited = isVisited
        self.phone     = phone
    }
}
