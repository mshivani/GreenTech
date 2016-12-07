//
//  EduFormViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 10/26/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit

class EduFormViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var resourceName: UITextField!
    
    @IBOutlet weak var resourceLink: UITextField!
    
    @IBOutlet weak var resourceDescription: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resourceName.delegate = self;
        resourceLink.delegate = self;
        resourceDescription.delegate = self;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
    }
    
    
   
    
    @IBAction func EnterButtonPressed(sender: UIButton) {
        
         let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EducationalViewController") as! EducationalViewController
        centerViewController.resourceTitle = [resourceName.text!]
        centerViewController.resourceLink = [resourceLink.text!]
        centerViewController.resourceDescription = [resourceDescription.text!]
        
        let centerNavController = UINavigationController(rootViewController: centerViewController)
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.centerViewController = centerNavController
        
        self.presentingViewController!.dismissViewControllerAnimated(false, completion: nil)
        
        
    }
    

    @IBAction func CancelButtonPressed(sender: UIButton) {
         self.presentingViewController!.dismissViewControllerAnimated(false, completion: nil)
    }
}
