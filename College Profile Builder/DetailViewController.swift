//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by John Gadbois on 1/21/16.
//  Copyright © 2016 John Gadbois. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    var college : CollegeObject!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        myImageView.image = college.image
    }
    
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
    }


}
