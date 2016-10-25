//
//  UploadViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 9/27/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import Foundation;
import MessageUI;
import UIKit

class UploadViewController: UIViewController, MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendEmail(sender: AnyObject) {
        let mailComposeController = MFMailComposeViewController()
        
        mailComposeController.mailComposeDelegate = self;
        
        mailComposeController.setToRecipients(["dearley@udel.edu"])
        
        mailComposeController.setSubject("GreenTech Information")
        
        mailComposeController.setMessageBody("This is an email", isHTML: false)
        
        
        
        if MFMailComposeViewController.canSendMail(){
            
            self.presentViewController(mailComposeController, animated: true, completion: { () -> Void in })
            
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        controller.dismissViewControllerAnimated(true) { () -> Void in
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func leftBarButtonPressed(sender: AnyObject) {
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    
}
