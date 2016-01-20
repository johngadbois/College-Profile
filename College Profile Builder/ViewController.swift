//
//  ViewController.swift
//  College Profile Builder
//
//  Created by John Gadbois on 1/20/16.
//  Copyright © 2016 John Gadbois. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    var colleges : [CollegeObject] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        colleges.append(CollegeObject(Name: "University of Michigan", Location: "Ann Arbor, Michigan", Enrollment: 43651, Image: UIImage(named: "default")!))
    }

}

