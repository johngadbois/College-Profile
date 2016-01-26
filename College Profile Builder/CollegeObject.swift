//
//  CollegeObject.swift
//  College Profile Builder
//
//  Created by John Gadbois on 1/20/16.
//  Copyright © 2016 John Gadbois. All rights reserved.
//

import UIKit

class CollegeObject: NSObject
{
    var name = ""
    var location = ""
    var enrollment = 0
    var image = UIImage(named: "default")
    
    init(Name: String, Location: String, Enrollment: Int, Image: UIImage)
    {
        super.init()
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
    }
    
    init(Name: String, Location: String, Enrollment: Int)
    {
        name = Name
        location = Location
        enrollment = Enrollment
    }
    
    
}
