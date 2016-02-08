//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by John Gadbois on 1/21/16.
//  Copyright © 2016 John Gadbois. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    
    var college : CollegeObject!
    var myImagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        myImageView.image = college.image
        websiteTextField.text = college.webpage
        myImagePicker.delegate = self
        myImagePicker.allowsEditing = true
    }
    
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
        college.webpage = websiteTextField.text!
        college.image = myImageView.image
    }

    @IBAction func websiteButtonTapped(sender: UIButton)
    {
        let url = NSURL(string: college.webpage)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        presentViewController(svc, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func imageTapped(sender: UITapGestureRecognizer)
    {
        let mySheet = UIAlertController(title: "Add From", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        mySheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (cameraAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            {
                self.myImagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.myImagePicker, animated: true, completion: nil)
            }
        }))
        mySheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (libraryAction) -> Void in
            self.myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.myImagePicker, animated: true, completion: nil)
        }))
        self.presentViewController(mySheet, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        myImagePicker.dismissViewControllerAnimated(true) { () -> Void in
            self.myImageView.image = info[UIImagePickerControllerEditedImage] as! UIImage
        }
    }
    
}
