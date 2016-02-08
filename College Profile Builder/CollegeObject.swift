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
    var webpage = ""
    
    init(Name: String, Location: String, Enrollment: Int, Image: UIImage, Website: String)
    {
        super.init()
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
        webpage = Website
    }
    
    
    init(Name: String, Location: String, Enrollment: Int, Website: String)
    {
        name = Name
        location = Location
        enrollment = Enrollment
        webpage = Website
    }
    
    
}
