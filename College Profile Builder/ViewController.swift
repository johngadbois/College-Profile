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
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [CollegeObject] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        colleges.append(CollegeObject(Name: "University of Michigan", Location: "Ann Arbor, Michigan", Enrollment: 43651, Image: UIImage(named: "michigan")!, Website: "https://www.umich.edu/"))
        colleges.append(CollegeObject(Name: "University of Wisconsin", Location: "Madison, Wisconsin", Enrollment: 43193, Image: UIImage(named: "wisc")!, Website: "http://www.wisc.edu/"))
        colleges.append(CollegeObject(Name: "Northwestern University", Location: "Evanston, Illinois", Enrollment: 20336, Image: UIImage(named: "north")!, Website: "http://www.northwestern.edu/"))
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel?.text = colleges[indexPath.row].name
        myCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }

    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if sender.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }

    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }

    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Location"
        }
        myAlert.addTextFieldWithConfigurationHandler { (enrollmentTextField) -> Void in
            enrollmentTextField.placeholder = "Enrollment"
        }
        myAlert.addTextFieldWithConfigurationHandler { (webpageTextField) -> Void in
            webpageTextField.placeholder = "Website"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (addAction) -> Void in
            let collegeTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let enrollmentTF = myAlert.textFields![2] as UITextField
            let webpageTF = myAlert.textFields![3] as UITextField
            self.colleges.append(CollegeObject(Name: collegeTF.text!, Location: locationTF .text!, Enrollment: Int(enrollmentTF.text!)!, Website: webpageTF.text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailVC.college = colleges[selectedRow!]
    }
    
    override func viewDidAppear(animated: Bool)
    {
        myTableView.reloadData()
    }

    
}

