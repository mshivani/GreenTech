//
//  EduFormViewController.swift
//  GreenTech
//
//  Created by Shivani Murali on 10/26/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit

class EduFormViewController: UIViewController {

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func CancelButtonPressed(sender: UIButton) {
        let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EducationalViewController") as! EducationalViewController
        self.presentViewController(centerViewController, animated:true, completion:nil)

    }
}
