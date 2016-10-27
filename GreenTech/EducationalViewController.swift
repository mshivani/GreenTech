//
//  EducationalViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 9/27/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit

class EducationalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func leftSideButton(sender: AnyObject) {
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    @IBAction func AddNewResourceButtonPressed(sender: UIButton) {
        
        let eduFormViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EduFormViewController") as! EduFormViewController
        
        self.presentViewController(eduFormViewController, animated:true, completion:nil)


    }
    
}
