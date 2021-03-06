//
//  AddEntryViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 10/5/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit

class AddEntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var powerTextField: UITextField!
    @IBOutlet weak var fuelTextField: UITextField!
    @IBOutlet weak var secondaryFuelTextField: UITextField!

    @IBOutlet weak var entryLabel: UILabel!
    
    var lat = 0.0
    var long = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        typeTextField.delegate = self;
        statusTextField.delegate = self;
        powerTextField.delegate = self;
        fuelTextField.delegate = self;
        secondaryFuelTextField.delegate = self;
        latLabel.text = String(round(1000 * lat) / 1000)
        longLabel.text = String(round(1000 * long) / 1000)
        
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
    
    // MARK: Actions
    @IBAction func addEntry(sender: UIButton) {

        
        let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        centerViewController.lat = lat
        centerViewController.long = long
        centerViewController.name = titleTextField.text!
        centerViewController.type = typeTextField.text!
        centerViewController.status = statusTextField.text!
        centerViewController.power = powerTextField.text!
        centerViewController.fuel = fuelTextField.text!
        centerViewController.secondaryFuel = secondaryFuelTextField.text!
        let centerNavController = UINavigationController(rootViewController: centerViewController)
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.centerViewController = centerNavController

        self.presentingViewController!.dismissViewControllerAnimated(false, completion: nil)

        
 
    }
    
    @IBAction func cancelEntry(sender: UIButton) {
        self.presentingViewController!.dismissViewControllerAnimated(false, completion: nil)

    }
    

}
