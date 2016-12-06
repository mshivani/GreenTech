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

        
        mailComposeController.setSubject("GreenTech Information")
        
        mailComposeController.setMessageBody("<div style='background-color: #dad7e1; padding: 5px 5px 5px 65px; width: 685px;'><strong>Research Site Name:</strong><br /><table border='1' cellpadding='5'><tbody><tr style='background-color: #a9abfe;'><th>&nbsp;</th><th>Tons CO2</th><th title='MWh of energy generated per year'>MWh Energy</th><th>Intensity</th></tr><tr style='background-color: #daebeb;'><td>2000</td><td style='text-align: right;'>13,520</td><td style='text-align: right;'>21,824</td><td style='text-align: right;'>620</td></tr><tr style='background-color: #daebeb;'><td>present</td><td style='text-align: right;'>7,938</td><td style='text-align: right;'>12,863</td><td style='text-align: right;'>617</td></tr><tr style='background-color: #daebeb;'><td>future</td><td style='text-align: right;'>7,938</td><td style='text-align: right;'>12,863</td><td style='text-align: right;'>617</td></tr></tbody></table><br /><table border='1'><tbody><tr style='background-color: #a9abfe;'><td style='width: 50px;'><span class='bold'> Power </span></td><td style='width: 150px;'><span class='bold'> Type </span></td><td style='width: 80px;'><span class='bold'> Status </span></td><td style='width: 80px;'><span class='bold'> Fuel </span></td><td style='width: 80px;' colspan='1'><span class='bold'> Secondary Fuel(s) </span></td></tr><tr style='background-color: #daebeb;'><td>45 MW</td><td>Burner: Turbine</td><td>Operating</td><td style='padding-left: 4px; padding-right: 4px;'>Natural Gas</td><td style='padding-left: 4px; padding-right: 4px;'>Oil</td></tr><tr style='background-color: #f2feee;'><td>51 MW</td><td>Burner: Turbine</td><td>Operating</td><td style='padding-left: 4px; padding-right: 4px;'>Natural Gas</td><td style='padding-left: 4px; padding-right: 4px;'>Oil</td></tr></tbody></table></div>", isHTML: true)
        
        
        
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
