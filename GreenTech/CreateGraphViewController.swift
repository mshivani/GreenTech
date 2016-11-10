//
//  CreateGraphViewController.swift
//  GreenTech
//
//  Created by Kate Travers on 11/9/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit

class CreateGraphViewController: UIViewController, UITextFieldDelegate {
    
    var inputText : String!
    var xValues = [String]()
    var yValues = [Double]()
    var ylabel : String!

    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var yLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        xTextField.delegate = self
        yTextField.delegate = self
        yLabel.delegate = self
        
        // Do any additional setup after loading the view.
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
    @IBAction func Submit(sender: UIButton) {
        
        let graphViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GraphViewController") as! GraphViewController
        graphViewController.xValues = self.xValues
        graphViewController.yValues = self.yValues
        graphViewController.ylabel = self.ylabel
        self.presentViewController(graphViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func Cancel(sender: UIButton) {
        let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EducationalViewController") as! EducationalViewController
        self.presentViewController(centerViewController, animated:true, completion:nil)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        //Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        inputText = textField.text!
        
        if(textField == xTextField){
            var x = ""
            for index in inputText.characters.indices {
                if(inputText[index] == " "){
                    xValues.append(x)
                    x = ""
                }
                else{
                    x.append(inputText[index])
                }
            }
            if(x != ""){
                xValues.append(x)
            }
        }
        
        if(textField == yTextField){
            var x = ""
            for index in inputText.characters.indices {
                if(inputText[index] == " "){
                    yValues.append(Double(x)!)
                    x = ""
                }
                else{
                    x.append(inputText[index])
                }
            }
            if(x != ""){
                yValues.append(Double(x)!)
            }
        }
        
        if(textField == yLabel){
            ylabel = inputText
        }
    }

}
